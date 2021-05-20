import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageResolutionPage extends StatefulWidget {
  @override
  _ImageResolutionPageState createState() => _ImageResolutionPageState();
}

class _ImageResolutionPageState extends State<ImageResolutionPage> {
  static const platform = const MethodChannel("image.editing_app/dev");
  File selectedImage;
  File modifiedImage;
  ImagePicker _imagePicker = ImagePicker();

  invokeMethodChannel(File image) async {
    final result = await platform.invokeMethod(
        'getModifiedImage', {"image": image.path}).catchError((e) {
      print("Platform error ");
      print("Platform error ");
    });
    print("Result from native Method : ${result.toString()}");
  }

  getImage() async {
    var image = await _imagePicker.getImage(source: ImageSource.gallery);

    if (image == null)
      return;
    else {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Resolution"),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Container(
          //  margin: EdgeInsets.all(20),
          height: height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              selectedImage == null
                  ? Container(
                      child: Text("Image is not selected"),
                    )
                  : Container(
                      height: height * 0.3, child: Image.file(selectedImage)),
              SizedBox(
                height: 20,
              ),
              modifiedImage == null
                  ? Container(
                      child: Text("Image is not modified"),
                    )
                  : Container(
                      height: height * 0.3, child: Image.file(selectedImage)),
              SizedBox(
                height: 20,
              ),
              // _image == null
              //     ? Container()
              //     : _outputs != null
              //     ? Text(
              //   _outputs[0]["label"],
              //   style: TextStyle(color: Colors.black, fontSize: 20),
              // )
              //     : Container(child: Text(""))
            ],
          ),
        ),
      ),
      floatingActionButton: selectedImage == null
          ? FloatingActionButton(
              onPressed: () {
                getImage();
              },
              tooltip: 'Increment',
              child: Icon(Icons.photo),
            )
          : FloatingActionButton(
              onPressed: () {
                invokeMethodChannel(selectedImage);
              },
              tooltip: 'DECREMENT',
              child: Icon(Icons.check),
            ),
    );
  }
}
