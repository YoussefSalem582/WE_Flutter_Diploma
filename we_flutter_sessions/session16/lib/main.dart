// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:session16/session16%20%20(5-9-2024)/firebase_options.dart';
// import 'package:session16/session18%20%20(12-9-2024)/postApp.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: PostApp(),
//   )
//   );
// }
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'session17/admin/product_provider.dart';
import 'session17/user/cart_screen.dart';
import 'session17/user/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(), // Implement login to navigate to admin/user
    );
  }
}
