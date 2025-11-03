import 'package:bloc/bloc.dart';
import 'package:untitled/we_flutter_sessions/session15%20%20(2-9-2024)/session15%20%20Solutions/bloc/counterBloc/counterState.dart';

class CounterLogic extends Cubit<CounterState> {
  CounterLogic() : super(InitCounter());

  int i = 10;

  void pCounter() {
    i++;
    emit(PCounter());
  }

  void mCounter() {
    i--;
    emit(MCounter());
  }

  void rCounter() {
    i = 0;
    emit(RCounter());
  }
}
