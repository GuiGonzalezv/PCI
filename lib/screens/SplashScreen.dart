import 'package:flutter/material.dart';
import 'dart:async';
import 'package:projectPCI/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const IconData copyright = IconData(0xe90c, fontFamily: 'MaterialIcons');
  
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      (){
        Navigator.pushReplacementNamed(context, "/login");
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex:4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.party_mode,
                          color: Colors.deepPurple,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0)
                      ),
                      Text(
                        "Recognize App",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                  ],
                )
              )
            ],
          )
        ],
      ),
    );
  }
}