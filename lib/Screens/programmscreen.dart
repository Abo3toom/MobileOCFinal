import 'package:blod/wedgit/mybutton.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class BottomNavyBarExample extends StatefulWidget {
  static const String programRoute = 'programscreen';
  const BottomNavyBarExample({Key? key}) : super(key: key);

  @override
  _BottomNavyBarExampleState createState() => _BottomNavyBarExampleState();
}

class _BottomNavyBarExampleState extends State<BottomNavyBarExample> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(61.782087, 34.360368),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      //bearing: 192.8334901395799,
      target: LatLng(61.782087, 34.360368),
      //tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      //print(e);}
    }
  }

  bool showPassword = false;
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  MaterialColor red = Colours.swatch('#C84B31');
  MaterialColor backgroundColor = Colours.swatch('#F3F3F3');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: <Widget>[
              Container(
                color: backgroundColor,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 10.0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Upcoming Events',
                              style: TextStyle(
                                fontFamily: "RobotoMono",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Column(
                            children: [
                              ExpansionTileCard(
                                title: Text(
                                  'Blood cell',
                                  style: TextStyle(
                                    fontFamily: "RobotoMono",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                children: <Widget>[
                                  Divider(
                                    thickness: 1.0,
                                    height: 1.0,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        """Dr.Alex 
                                        I will explain how the blood cell works with viruses, and how white cells can attack any virus.
                                        To communicate: 
                                        +79999999999""",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "RobotoMono",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ExpansionTileCard(
                                title: Text(
                                  'Blood rules',
                                  style: TextStyle(
                                    fontFamily: "RobotoMono",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                children: <Widget>[
                                  Divider(
                                    thickness: 1.0,
                                    height: 1.0,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        """Dr.Alex 
                                        I will explain how the blood cell works with viruses, and how white cells can attack any virus.
                                        To communicate: 
                                        +79999999999""",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "RobotoMono",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ExpansionTileCard(
                                title: Text(
                                  'Blood & heart',
                                  style: TextStyle(
                                    fontFamily: "RobotoMono",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                children: <Widget>[
                                  Divider(
                                    thickness: 1.0,
                                    height: 1.0,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        """Dr.Alex 
                                        I will explain how the blood cell works with viruses, and how white cells can attack any virus.To communicate: 
                                        +79999999999""",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "RobotoMono",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //saas
              Container(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ), //asas
              Container(
                color: backgroundColor,
                child: Container(
                  padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new AssetImage('images/man.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        buildTextField("Username", "anas2", false),
                        buildTextField("Age", "20", false),
                        buildTextField("Blood type", "4", false),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyButton(
                              color: red,
                              title: 'Logout',
                              onPressed: () {
                                _auth.signOut();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: false,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.map_outlined),
                title: Text('Map'),
                activeColor: red),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Profile'),
                activeColor: red),
          ],
        ));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  _buildPage({IconData? icon, String? title, Color? color}) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 200.0, color: Colors.white),
            Text(title!, style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
