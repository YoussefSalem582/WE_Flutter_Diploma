// map_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/EV bloc/EV logic.dart';


class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EV Charging Station Finder'),
      ),
      body: BlocBuilder<EVBloc, EVState>(
        builder: (context, state) {
          if (state is EVLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EVStationsLoaded) {
            final stations = state.stations;

            return GestureDetector(
              onTapDown: (TapDownDetails details) {
                print('Map tapped at ${details.localPosition}');
                _addStationDialog(context, details.localPosition);
              },
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/map.gif',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  // Overlay charging station markers
                  ...stations.map((station) {
                    double xPosition = station['x'] * MediaQuery.of(context).size.width;
                    double yPosition = station['y'] * MediaQuery.of(context).size.height;

                    return Positioned(
                      left: xPosition - 24,
                      top: yPosition - 24,
                      child: GestureDetector(
                        onTap: () {
                          print('Station tapped: ${station['name']} (${station['id']})');
                          _confirmDeleteStation(context, station['id']);
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(24),
                          child: Icon(
                            Icons.ev_station,
                            size: 24,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            );
          } else if (state is EVError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return Center(child: Text('Unknown state'));
        },
      ),
    );
  }

  void _addStationDialog(BuildContext context, Offset position) {
    double xPercent = position.dx / MediaQuery.of(context).size.width;
    double yPercent = position.dy / MediaQuery.of(context).size.height;

    TextEditingController nameController = TextEditingController();
    TextEditingController speedController = TextEditingController();
    bool available = true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Charging Station'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Station Name'),
              ),
              TextField(
                controller: speedController,
                decoration: InputDecoration(labelText: 'Charging Speed'),
              ),
              CheckboxListTile(
                title: Text('Available'),
                value: available,
                onChanged: (bool? value) {
                  available = value ?? true;
                },
              ),
            ],
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
                context.read<EVBloc>().add(AddStationEvent(
                  x: xPercent,
                  y: yPercent,
                  name: nameController.text,
                  speed: speedController.text,
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

  void _confirmDeleteStation(BuildContext context, String stationId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Station'),
          content: Text('Are you sure you want to delete this station?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
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
}

