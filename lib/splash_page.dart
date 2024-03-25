import 'dart:async';

import 'package:bmi_finder/main.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 1750), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(title: "BMI Finder")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome to BMI Calculator",
          style: TextStyle(
              color: Colors.red, fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
