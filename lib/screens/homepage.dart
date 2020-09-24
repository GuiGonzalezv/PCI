import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'object.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text('OCR - Reconhecimento ótico de caracteres'),
              subtitle: Text('É uma tecnologia para reconhecer caracteres a partir de um arquivo de imagem ou mapa de bits sejam eles escaneados, escritos a mão, datilografados ou impressos. Dessa forma, através do OCR é possível obter um arquivo de texto editável por um computador'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('COMEÇAR'),
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TfliteHome()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      )
      )
    );
  }
}