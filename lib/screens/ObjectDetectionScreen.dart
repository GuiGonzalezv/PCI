import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;


const String ssd = 'SSD MobileNet*';
const String yolo = "Tiny Yolov2*";

class ObjectDetectionScreen extends StatefulWidget {
  @override
  _ObjectDetectionScreenState  createState() => _ObjectDetectionScreenState();
}

class _ObjectDetectionScreenState extends State<ObjectDetectionScreen> {
  String _model = ssd;
  File _image;

  double _imageWidth;
  double _imageHeight;
  bool _busy = false;

  List _recognitions;
  
  @override
  void initState(){
    super.initState();
    _busy = true;

    loadModel().then((val) => {
      setState(() {
        _busy = false;
      })
    });
  }

  loadModel() async {
    Tflite.close();
    try{
      String response;

      if(_model == yolo){
        response = await Tflite.loadModel(
          model: "assets/tflite/yolov2_tiny.tflite",
          labels: "assets/tflite/yolov2_tiny.txt"
        );
      }else{
        response = await Tflite.loadModel(
          model: "assets/tflite/ssd_mobilenet.tflite",
          labels: "assets/tflite/ssd_mobilenet.txt" 
        );
      }
      print(response);
    }on PlatformException{
      print ("Erro ao carregar o modelo");
    }
  }

  selectFromImagePicker() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if(image == null) return;
    setState(() {
      _busy = true;
    });
    productImage(image);
  }

  productImage(image) async {
      if(image == null) return;

      if(_model == yolo){
        await yolo2Tiny(image);
      }else{
        await ssdMobileNet(image);
      }

      FileImage(image).resolve(ImageConfiguration()).addListener(ImageStreamListener((ImageInfo info, bool _) {
        setState(() {
          _imageWidth = info.image.width.toDouble();
          _imageHeight = info.image.height.toDouble();
        });
      }));

      setState(() {
        _image = image;
        _busy = false;
      });

  }

  yolo2Tiny(image) async {
    var recognitions = await Tflite.detectObjectOnImage(
      path: image.path,
      model: "YOLO",
      threshold: 0.3,
      imageMean: 0.0,
      imageStd: 255.0,
      numResultsPerClass: 1
    );

    setState(() {
      _recognitions = recognitions;
    });
  }

  ssdMobileNet(image) async{
    var recognitions = await Tflite.detectObjectOnImage(
      path: image.path,
      numResultsPerClass: 1
    );

    setState(() {
      _recognitions = recognitions;
    });
  }

  List<Widget> renderBoxes(Size screen) {
    if(_recognitions == null) return [];
    if(_imageWidth == null || _imageHeight == null) return [];

    double factorX = screen.width;
    double factorY = _imageHeight/_imageWidth*screen.width;

    Color blue = Colors.red;

    return _recognitions.map((rec){
      return Positioned(
        left: rec["rect"]["x"] * factorX,
        top: rec["rect"]["y"] * factorY,
        width: rec["rect"]["w"] * factorX,
        height: rec["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(border: Border.all(
            color: blue,
            width: 3
          )),
          child: Text("${rec["detectedClass"]} ${(rec["confidenceInClass"]*100).toStringAsFixed(0) + '%'}",
          style: TextStyle(
            background: Paint()..color=blue,
            color: Colors.white,
            fontSize: 15
          ),),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    List<Widget> stackChildren = [];

    stackChildren.add(Positioned(
      top: 0.0,
      left: 0.0,
      width: size.width,
      child: _image == null ? Text("Nenhuma imagem selecionada") : Image.file(_image)
    ));

    stackChildren.addAll(renderBoxes(size));

    if(_busy){
      stackChildren.add(Center(child: CircularProgressIndicator()));
    }    

    return Scaffold(
      appBar: AppBar(
        title: Text("Object Recognize"),
        backgroundColor: Colors.deepPurple,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        tooltip: "Selecione uma imagem da galeria!",
        backgroundColor: Colors.deepPurple,
        onPressed: selectFromImagePicker,
      ),

      body: Stack(
        children: stackChildren,
      )
    );
  }
}

