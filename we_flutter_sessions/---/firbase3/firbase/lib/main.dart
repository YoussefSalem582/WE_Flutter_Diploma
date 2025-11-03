import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Ev/mapScreen.dart';
import 'bloc/EV bloc/EV logic.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<EVBloc>(
            create: (context) => EVBloc()..add(FetchStationsEvent()), // Initialize with an event to fetch stations
          ),
        ],
        child: MyApp(),
      ),
    );
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}
