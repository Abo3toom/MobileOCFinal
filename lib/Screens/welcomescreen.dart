import 'package:blod/Screens/registerscreen.dart';
import 'package:blod/Screens/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:blod/wedgit/mybutton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String welcomeRoute = 'welcomescreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  MaterialColor backgroundColor = Colours.swatch('#F3F3F3');
  MaterialColor blue = Colours.swatch('#2D4263');
  MaterialColor red = Colours.swatch('#C84B31');
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Image.asset(
                'images/Group1.png',
              ),
            ],
          ),
          const SizedBox(
            height: 160,
          ),
          MyButton(
            color: red,
            title: 'Sign in',
            onPressed: () {
              Navigator.pushNamed(context, SigninScreen.signinRoute);
            },
          ),
          MyButton(
            color: blue,
            title: 'Register',
            onPressed: () {
              Navigator.pushNamed(context, RegisterScreen.registerRoute);
            },
          ),
        ],
      ),
    );
  }
}
