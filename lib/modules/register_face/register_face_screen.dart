import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegisterFaceScreen extends StatefulWidget {
  @override
  _RegisterFaceScreenState createState() => _RegisterFaceScreenState();
}

class _RegisterFaceScreenState extends State<RegisterFaceScreen> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Register new person'),
            Container(
                child: _image != null
                    ? new Image.file(
                        _image,
                        height: 400.0,
                      )
                    : new Column(children: <Widget>[
                        Icon(
                          Icons.image,
                          size: 200.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        RaisedButton(
                          child: Icon(Icons.add_a_photo),
                          onPressed: getImage,
                        )
                      ])),
            Container(
              padding: EdgeInsets.all(50),
              child: TextField()
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                    child: Text('Back'),
                    onPressed: () => Navigator.of(context).pop()),
                RaisedButton(
                  child: Text('Done'),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
