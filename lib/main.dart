import 'package:flutter/material.dart';
import 'modules/endpointpick/endpoint_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/main/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenFaceVault',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/main' : (context) => MainScreen(),
        '/endpoint' : (context) => EndpointScreen(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String endpoint = '';

  @override
  void initState(){
    _loadEndpointAddress();
  }

  _loadEndpointAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      endpoint = (prefs.getString('endpoint') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    if(endpoint == ''){
      return EndpointScreen();
    }
    return MainScreen();
  }
}
