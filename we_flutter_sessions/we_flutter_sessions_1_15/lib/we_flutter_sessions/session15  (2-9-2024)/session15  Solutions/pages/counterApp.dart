import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/we_flutter_sessions/session11%20%20(19-8-2024)/task%2011.3%20%20(solution)/buttons.dart';
import 'package:untitled/we_flutter_sessions/session15%20%20(2-9-2024)/session15%20%20Solutions/bloc/counterBloc/counterLogic.dart';

import '../bloc/counterBloc/counterState.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterLogic(),
      child: BlocConsumer<CounterLogic, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          CounterLogic obj = BlocProvider.of(context);
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
                    btnCal(
                        text: "+",
                        event: () {
                          obj.pCounter();
                        }),
                    btnCal(
                        text: "-",
                        event: () {
                          obj.mCounter();
                        }),
                    btnCal(
                        text: "R",
                        event: () {
                          obj.rCounter();
                        })
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
