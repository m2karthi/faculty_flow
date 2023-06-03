import 'package:faculty_flow/screens/TasksByStatusPage.dart';
import 'package:faculty_flow/screens/home.dart';
import 'package:faculty_flow/widgets/onboarding/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:firebase_core/firebase_core.dart';


import 'screens/tasks.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenTemp(),

      routes: {
        '/tasks': (context) => TasksPage(),
        // '/tasksbystatus' : (context) => TasksByStatusPage()
      },
      // home: HomeScreen()
    );
  }
}
