import 'dart:async';
import 'package:deeplaid_apps_models/doctor_list/doctorlist.dart';
import 'package:deeplaid_apps_models/splash_deeplaid_apps/splash.dart';
import 'package:deeplaid_apps_models/sync_deeplaid_apps/sync.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deeplaid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DoctorList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

