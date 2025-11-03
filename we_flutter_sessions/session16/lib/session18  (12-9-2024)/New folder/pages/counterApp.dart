

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session16/session18%20%20(12-9-2024)/New%20folder/bloc/counterBloc/counterLogic.dart';
import 'package:session16/session18%20%20(12-9-2024)/New%20folder/component/buttons.dart';


import '../bloc/counterBloc/counterState.dart';



class CounterApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CounterLogic(),
      child:BlocConsumer<CounterLogic,CounterState>(
        listener: (context,state){},
        builder: (context,state){
          CounterLogic obj=BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightGreenAccent,
            ),
            body: Column(
              children: [
                Text("${obj.i}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    btnCal(text: "+", event: (){
                      obj.pCounter();

                    }),
                    btnCal(text: "-", event: (){
                     obj.mCounter();

                    }),
                    btnCal(text: "R", event: (){
                     obj.rCounter();
                    })
                  ],
                ),
              ],
            ),
          );
        },

      ) ,
    );
  }
}
