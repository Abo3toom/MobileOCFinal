import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.color,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 7),
      child: Material(
        elevation: 10,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 50,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: "RobotoMono",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
