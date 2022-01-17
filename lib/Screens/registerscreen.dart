import 'package:blod/Screens/programmscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static const String registerRoute = 'registerscreen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  var username = '';
  var age = 0;
  var bloodtype = 0;

  MaterialColor backgroundColor = Colours.swatch('#F3F3F3');
  MaterialColor red = Colours.swatch('#C84B31');
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
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
                    "Register",
                    style: TextStyle(
                      color: red,
                      fontFamily: "RobotoMono",
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 60.0),
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
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      username = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(
                        Icons.perm_identity,
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
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      age = int.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Age',
                      prefixIcon: Icon(
                        Icons.date_range,
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
                  ToggleSwitch(
                    activeFgColor: Colors.white,
                    inactiveFgColor: Colors.white,
                    inactiveBgColor: Colors.white,
                    activeBgColor: [red],
                    borderWidth: 1.0,
                    borderColor: [red],
                    initialLabelIndex: 0,
                    cornerRadius: 30.0,
                    minWidth: 35,
                    totalSwitches: 8,
                    labels: const [
                      'I+',
                      'II+',
                      'III+',
                      'IV+',
                      'I-',
                      'II-',
                      'III-',
                      'IV-',
                    ],
                    customTextStyles: const [
                      TextStyle(
                          color: Colors.black,
                          fontSize: 9.0,
                          fontWeight: FontWeight.w900),
                      TextStyle(
                          color: Colors.black,
                          fontSize: 9.0,
                          fontWeight: FontWeight.w900),
                      TextStyle(
                          color: Colors.black,
                          fontSize: 9.0,
                          fontWeight: FontWeight.w900),
                      TextStyle(
                          color: Colors.black,
                          fontSize: 9.0,
                          fontWeight: FontWeight.w900),
                      TextStyle(
                          color: Colors.black,
                          fontSize: 9.0,
                          fontWeight: FontWeight.w900),
                      TextStyle(
                          color: Colors.black,
                          fontSize: 9.0,
                          fontWeight: FontWeight.w900),
                      TextStyle(
                          color: Colors.black,
                          fontSize: 9.0,
                          fontWeight: FontWeight.w900),
                      TextStyle(
                          color: Colors.black,
                          fontSize: 9.0,
                          fontWeight: FontWeight.w900),
                    ],
                    onToggle: (index) {
                      bloodtype = int.parse('$index');
                    },
                  ),
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Material(
                      elevation: 10,
                      color: red,
                      borderRadius: BorderRadius.circular(30),
                      child: MaterialButton(
                        onPressed: () async {
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            users.add({
                              'username': username,
                              'age': age,
                              'bloodtype': bloodtype,
                            }).then((value) => print('User Added'));
                            Navigator.pushNamed(
                                context, BottomNavyBarExample.programRoute);
                          } catch (e) {
                            print(e);
                          }
                        },
                        minWidth: 400,
                        height: 50,
                        child: const Text(
                          "Sign up",
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
