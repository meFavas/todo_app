// ignore_for_file: prefer_const_constructors, annotate_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/utils/colorconstants.dart';
import 'package:todo_app/view/homescreen/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreen(),
        ),
      );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Todocolors.todogrey,
      body: Center(
        child: Image.asset("android/assets/productivity.png"),
      ),
    );
  }
}
