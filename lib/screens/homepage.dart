import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectPCI/screens/ObjectDetectionScreen.dart';


class HomePageScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePageScreen> {

  void goToObjectDecection(){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ObjectDetectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Recognize App",
          style: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
              Padding(padding: EdgeInsets.all(15.00)),
              GestureDetector(
                onTap: () => {goToObjectDecection()},
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    color: Colors.white,
                    height: 170.0,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(20.00)),
                        Icon(
                          Icons.party_mode,
                          size: 50.0,
                          color: Colors.deepPurple,
                        ),
                        Padding(padding: EdgeInsets.all(5.00)),
                        Text(
                          "Object Detection",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                          ),
                        ),                    
                      ],
                    ),
                  ), 
                ),
              ),
              Padding(padding: EdgeInsets.all(10.00)),
              GestureDetector(
                onTap: () => {goToObjectDecection()},
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    color: Colors.white,
                    height: 170.0,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(20.00)),
                        Icon(
                          Icons.text_fields,
                          size: 50.0,
                          color: Colors.deepPurple,
                        ),
                        Padding(padding: EdgeInsets.all(5.00)),
                        Text(
                          "OCR - Optical Character Recognition",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                          ),
                        ),                    
                      ],
                    ),
                  ), 
                ),
              ),
              Padding(padding: EdgeInsets.all(10.00)),
              GestureDetector(
                onTap: () => {goToObjectDecection()},
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    color: Colors.white,
                    height: 170.0,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(20.00)),
                        Icon(
                          Icons.directions_car,
                          size: 50.0,
                          color: Colors.deepPurple,
                        ),
                        Padding(padding: EdgeInsets.all(5.00)),
                        Text(
                          "Car Detection",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                          ),
                        ),                    
                      ],
                    ),
                  ), 
                ),
              )
          ]
        ),
      padding: EdgeInsets.all(10.0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 0,
        backgroundColor: Colors.deepPurple,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            title: Text('School', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.white),
            title: Text('School', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.white),
            title: Text('School', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.white
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}