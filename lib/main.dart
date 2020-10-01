import 'package:flutter/material.dart';
import 'package:projectPCI/screens/ObjectDetectionScreen.dart';
import 'package:projectPCI/screens/SplashScreen.dart';
import 'package:projectPCI/screens/homepage.dart';
import 'package:projectPCI/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
      routes: {
        "/home": (_) => new HomePageScreen(),
        "/splashScreen": (_) => new SplashScreen(),
        "/login": (_) => new LoginScreen(),
        "/object": (_) => new ObjectDetectionScreen()
      },
    );
  }
}

