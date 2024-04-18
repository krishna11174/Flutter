// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_project/mobile_files/home_screen.dart';
import 'package:mobile_project/mobile_files/log_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.orange,),
    );
  }
}

