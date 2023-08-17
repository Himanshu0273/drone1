// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import '../components/homepage.dart';
import 'server.dart';

void main() {
  mainServer();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  int x = max(10, 20);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
