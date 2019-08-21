import 'package:flutter/material.dart';
import 'modules/endpointpick/endpoint_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/main/main_screen.dart';
import 'modules/login/login_screen.dart';

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
        '/login' : (context) => LoginScreen()
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
  String token = '';

  @override
  void initState(){
    _loadEndpointAndToken();
  }

  _loadEndpointAndToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      endpoint = (prefs.getString('endpoint') ?? '');
      token = (prefs.getString('token') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    if(endpoint == ''){
      return EndpointScreen();
    }
    if(token == ''){
      return LoginScreen();
    }
    return MainScreen();
  }
}
