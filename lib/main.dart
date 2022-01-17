import 'package:blod/Screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'Screens/welcomescreen.dart';
import 'Screens/signinscreen.dart';
import 'Screens/registerscreen.dart';
import 'Screens/programmscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: WelcomeScreen(),
      initialRoute: WelcomeScreen.welcomeRoute,
      routes: {
        WelcomeScreen.welcomeRoute: (context) => WelcomeScreen(),
        RegisterScreen.registerRoute: (context) => RegisterScreen(),
        SigninScreen.signinRoute: (context) => SigninScreen(),
        BottomNavyBarExample.programRoute: (context) => BottomNavyBarExample(),
      },
    );
  }
}
