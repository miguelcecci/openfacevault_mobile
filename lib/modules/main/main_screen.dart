import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String endpoint = '';
  String token = '';

  @override
  void initState(){
    _loadEndpointAddress();
  }

  _loadEndpointAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      endpoint = (prefs.getString('endpoint') ?? '');
      token = (prefs.getString('token') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Text(
            "Main Screen. Your endpoint is: "+endpoint+
              "Your token is: "+token
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/faces');
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )
      ),
    );
  }
}
