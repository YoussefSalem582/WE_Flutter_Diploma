



import 'package:bloc/bloc.dart';
import 'package:session16/session18%20%20(12-9-2024)/New%20folder/bloc/counterBloc/counterState.dart';

class CounterLogic extends Cubit<CounterState>
{
  CounterLogic():super(InitCounter());

  int i=10;

  void pCounter()
  {
    i++;
    emit(PCounter());
  }
  void mCounter(){
    i--;
    emit(MCounter());

  }
  void rCounter(){
    i=0;
    emit(RCounter());
  }
}