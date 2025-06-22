import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const ({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Splash Screen", style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}