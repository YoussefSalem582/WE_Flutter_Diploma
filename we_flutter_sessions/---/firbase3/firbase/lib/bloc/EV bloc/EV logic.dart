import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart'; // Import LatLng

// Define the events
abstract class EVEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchStationsEvent extends EVEvent {}

class AddStationEvent extends EVEvent {
  final double x;
  final double y;
  final String name;
  final String speed;
  final bool available;
  final LatLng dimensions; // Replaced height and width with LatLng
  final String type;

  AddStationEvent({
    required this.x,
    required this.y,
    required this.name,
    required this.speed,
    required this.available,
    required this.dimensions,  // LatLng for dimensions
    required this.type,
  });

  @override
  List<Object> get props => [x, y, name, speed, available, dimensions, type];
}

class DeleteStationEvent extends EVEvent {
  final String stationId;

  DeleteStationEvent(this.stationId);

  @override
  List<Object> get props => [stationId];
}

// Define the states
abstract class EVState extends Equatable {
  @override
  List<Object> get props => [];
}

class EVLoading extends EVState {}

class EVStationsLoaded extends EVState {
  final List<Map<String, dynamic>> stations;

  EVStationsLoaded(this.stations);

  @override
  List<Object> get props => [stations];
}

class EVError extends EVState {
  final String message;

  EVError(this.message);

  @override
  List<Object> get props => [message];
}

// Define the BLoC
class EVBloc extends Bloc<EVEvent, EVState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  EVBloc() : super(EVLoading()) {
    on<FetchStationsEvent>((event, emit) async {
      await _fetchStations(emit);
    });

    on<AddStationEvent>((event, emit) async {
      await _addStation(
        event.x,
        event.y,
        event.name,
        event.speed,
        event.available,
        event.dimensions,  // Pass LatLng for dimensions
        event.type,
        emit,
      );
    });

    on<DeleteStationEvent>((event, emit) async {
      await _deleteStation(event.stationId, emit);
    });
  }

  Future<void> _fetchStations(Emitter<EVState> emit) async {
    try {
      emit(EVLoading());
      QuerySnapshot snapshot = await _firestore.collection('stations').get();
      List<Map<String, dynamic>> stations = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          'id': doc.id,
          'x': data['x'] ?? 0.0,
          'y': data['y'] ?? 0.0,
          'name': data['name'] ?? 'Unknown Station',
          'speed': data['speed'] ?? 'Unknown Speed',
          'available': data['available'] ?? false,
          'dimensions': LatLng(data['lat'] ?? 0.0, data['lng'] ?? 0.0),  // Fetch LatLng for dimensions
          'type': data['type'] ?? 'Unknown',
        };
      }).toList();
      emit(EVStationsLoaded(stations));
    } catch (e) {
      emit(EVError('Error fetching stations: $e'));
    }
  }

  Future<void> _addStation(
      double x,
      double y,
      String name,
      String speed,
      bool available,
      LatLng dimensions,  // Use LatLng for dimensions
      String type,
      Emitter<EVState> emit,
      ) async {
    try {
      await _firestore.collection('stations').add({
        'x': x,
        'y': y,
        'name': name,
        'speed': speed,
        'available': available,
        'lat': dimensions.latitude,  // Store latitude as height
        'lng': dimensions.longitude, // Store longitude as width
        'type': type,
      });

      // Fetch updated stations
      await _fetchStations(emit);
    } catch (e) {
      emit(EVError('Error adding station: $e'));
    }
  }

  Future<void> _deleteStation(String stationId, Emitter<EVState> emit) async {
    try {
      await _firestore.collection('stations').doc(stationId).delete();
      // Fetch updated stations
      await _fetchStations(emit);
    } catch (e) {
      emit(EVError('Error deleting station: $e'));
    }
  }
}
