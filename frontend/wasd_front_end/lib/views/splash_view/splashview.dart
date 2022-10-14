// ignore_for_file: avoid_print
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/constants/constants.dart';

// ignore: use_key_in_widget_constructors
class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 3,
        ), () {
          Navigator.of(context).popAndPushNamed(DeciderRoute);
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ConstantColors.primaryColor,
      body: Center(
        child: Image(image: AssetImage('lib/static/logo.png'),height: 150,width: 150,),
      ),
    );
  }
}