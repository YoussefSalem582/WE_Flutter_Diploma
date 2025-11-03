import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/EV bloc/EV logic.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double _zoomLevel = 13.0; // Initial zoom level for the map
  late MapController _mapController; // For controlling the map programmatically

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    // Fetch stations when the screen is initialized
    context.read<EVBloc>().add(FetchStationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EVBloc, EVState>(
        builder: (context, state) {
          if (state is EVLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EVStationsLoaded) {
            final stations = state.stations;

            return Stack(
              children: [
                // Flutter map
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    center: LatLng(30.0444, 31.2357),
                    // Initial map center (Cairo coordinates)
                    zoom: _zoomLevel,
                    onTap: (tapPosition, latlng) {
                      _addStationDialog(context, latlng);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: stations.map((station) {
                        double lat =
                            station['x'] ?? 0.0; // Use 'x' for latitude
                        double lng =
                            station['y'] ?? 0.0; // Use 'y' for longitude
                        String stationName =
                            station['name'] ?? 'Unknown Station';
                        String stationType = station['type'] ?? 'Unknown';

                        return Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(lat, lng),
                          child: GestureDetector(
                            onTap: () {
                              _showStationDetailsDialog(
                                  context, stationName, lat, lng, stationType);
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.ev_station,
                                  color: Colors.green,
                                  // You can change the color dynamically
                                  size: 40.0, // Adjust marker size if necessary
                                ),
                                SizedBox(height: 4),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 2,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    stationName,
                                    // Display station name under the icon
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                // Zoom in/out buttons at the bottom right corner
                Positioned(
                  bottom: 80, // Place it above the add station button
                  right: 16, // Align to the right
                  child: Column(
                    children: [
                      FloatingActionButton(
                        heroTag: 'zoom_in',
                        mini: true,
                        backgroundColor: Colors.teal,
                        onPressed: () {
                          setState(() {
                            _zoomLevel = (_zoomLevel + 1).clamp(2.0, 18.0);
                            _mapController.move(
                                _mapController.center, _zoomLevel);
                          });
                        },
                        child: Icon(Icons.zoom_in),
                      ),
                      SizedBox(height: 10),
                      FloatingActionButton(
                        heroTag: 'zoom_out',
                        mini: true,
                        backgroundColor: Colors.teal,
                        onPressed: () {
                          setState(() {
                            _zoomLevel = (_zoomLevel - 1).clamp(2.0, 18.0);
                            _mapController.move(
                                _mapController.center, _zoomLevel);
                          });
                        },
                        child: Icon(Icons.zoom_out),
                      ),
                    ],
                  ),
                ),
                // Add Station button at the bottom right corner
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton(
                    heroTag: 'add_station',
                    backgroundColor: Colors.blueAccent,
                    onPressed: () {
                      _addStationDialog(
                          context,
                          LatLng(_mapController.center.latitude,
                              _mapController.center.longitude));
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            );
          } else if (state is EVError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return Center(child: Text('Unknown state'));
        },
      ),
    );
  }

  void _addStationDialog(BuildContext context, LatLng position) {
    // Text editing controllers for additional fields
    TextEditingController nameController = TextEditingController();
    TextEditingController speedController = TextEditingController();
    TextEditingController latitudeController = TextEditingController();
    TextEditingController longitudeController = TextEditingController();
    TextEditingController typeController = TextEditingController();
    bool available = true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Charging Station'),
          content: SingleChildScrollView(
            // Add SingleChildScrollView for better handling of multiple fields
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text fields for station details
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Station Name'),
                ),
                TextField(
                  controller: speedController,
                  decoration: InputDecoration(labelText: 'Charging Speed'),
                ),
                // Text fields for dimensions
                TextField(
                  controller: latitudeController,
                  decoration: InputDecoration(labelText: 'Station Latitude'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: longitudeController,
                  decoration: InputDecoration(labelText: 'Station Longitude'),
                  keyboardType: TextInputType.number,
                ),
                // Additional field for station type
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(labelText: 'Station Type'),
                ),
                // Checkbox to specify availability
                CheckboxListTile(
                  title: Text('Available'),
                  value: available,
                  onChanged: (bool? value) {
                    setState(() {
                      available = value ?? true;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Dispatch AddStationEvent with additional fields
                context.read<EVBloc>().add(AddStationEvent(
                      x: position.latitude,
                      // Latitude of the clicked point
                      y: position.longitude,
                      // Longitude of the clicked point
                      name: nameController.text,
                      speed: speedController.text,
                      dimensions: LatLng(
                          double.tryParse(latitudeController.text) ?? 0.0,
                          double.tryParse(longitudeController.text) ?? 0.0),
                      // Use LatLng for latitude/longitude
                      type: typeController.text,
                      available: available,
                    ));
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteStation(BuildContext context, String stationId,
      String stationName, double lat, double lng) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Station Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $stationName'),
              SizedBox(height: 8),
              Text('Latitude: $lat'),
              Text('Longitude: $lng'),
              SizedBox(height: 16),
              Text('Do you want to delete this station or visit?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _launchUrl(lat, lng); // Open Google Maps
              },
              child: Text('Visit'),
            ),
            TextButton(
              onPressed: () {
                context.read<EVBloc>().add(DeleteStationEvent(stationId));
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Function to launch Google Maps for a specific location
  void _launchUrl(double lat, double lng) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  // Add the missing method here
  void _showStationDetailsDialog(
      BuildContext context, String name, double lat, double lng, String type) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Type: $type'),
              Text('Latitude: $lat'),
              Text('Longitude: $lng'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
