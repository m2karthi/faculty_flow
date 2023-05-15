import 'package:faculty_flow/screens/home.dart';
import 'package:faculty_flow/widgets/onboarding/template.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenTemp(),
      // home: HomeScreen()
    );
  }
}
