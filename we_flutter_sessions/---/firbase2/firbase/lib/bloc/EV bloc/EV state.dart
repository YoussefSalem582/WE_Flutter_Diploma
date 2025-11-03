// ev_state.dart
abstract class EVState {}

class EVInitial extends EVState {}

class EVLoading extends EVState {}

class EVFetchSuccess extends EVState {
  final List<Map<String, dynamic>> stations;

  EVFetchSuccess(this.stations);
}

class EVError extends EVState {
  final String error;

  EVError(this.error);
}
