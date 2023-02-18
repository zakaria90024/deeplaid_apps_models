import 'dart:async';
import 'package:deeplaid_apps_models/splash_deeplaid_apps/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashDeeplaid(),
      debugShowCheckedModeBanner: false,
    );
  }
}

