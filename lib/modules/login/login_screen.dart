import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final userNameField = TextEditingController();
  final passwordField = TextEditingController();
  var warningText = ' ';

  @override
  void dispose() {
    userNameField.dispose();
    passwordField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(50),
                child: TextField(
                  controller: userNameField,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Username'
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(50),
                child: TextField(
                  controller: passwordField,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Password',
                  ),
                ),
              ),
              Center(
                child: Text(warningText),
              )
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
