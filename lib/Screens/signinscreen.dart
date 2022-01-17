import 'package:blod/Screens/programmscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:colours/colours.dart';

class SigninScreen extends StatefulWidget {
  static const String signinRoute = 'signinscreen';
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  MaterialColor backgroundColor = Colours.swatch('#F3F3F3');
  MaterialColor red = Colours.swatch('#C84B31');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Container(
            height: size.height - 80.0,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/imageicon.png'),
                  Text(
                    "Sign in",
                    style: TextStyle(
                      color: red,
                      fontFamily: "RobotoMono",
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 60),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: red,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: red,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: red,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.password_outlined,
                        color: red,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: red,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: red,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 235),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Material(
                      elevation: 10,
                      color: red,
                      borderRadius: BorderRadius.circular(30),
                      child: MaterialButton(
                        onPressed: () async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.pushNamed(
                                  context, BottomNavyBarExample.programRoute);
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        minWidth: 400,
                        height: 50,
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontFamily: "RobotoMono",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
