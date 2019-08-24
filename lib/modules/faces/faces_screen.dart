import 'package:flutter/material.dart';
import 'package:openfacevault_mobile/modules/faces/bloc/faces_bloc.dart';

class FacesScreen extends StatefulWidget {
  @override
  _FacesScreenState createState() => _FacesScreenState();
}

class _FacesScreenState extends State<FacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('faces'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      )
    );
  }
}