import 'package:flutter/material.dart';
import 'package:openfacevault_mobile/repositories/user_repository.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _userRepository = UserRepository();

  final userNameField = TextEditingController();
  final endpointField = TextEditingController();
  final passwordField = TextEditingController();
  var loading = false;
  var warningText = '';

  @override
  void initState() {
    endpointField.text = '35.239.205.136';
    super.initState();
  }

  @override
  void dispose() {
    userNameField.dispose();
    passwordField.dispose();
    endpointField.dispose();
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
              Container(
                padding: EdgeInsets.all(50),
                child: TextField(
                  controller: endpointField,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Endpoint',
                  ),
                ),
              ),
              Center(
                child: Text(warningText),
              ),
              Visibility(
                visible: this.loading,
                child: CircularProgressIndicator(),
              )
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            this.loading = true;
          });
          if(await this._userRepository.doLogin(userNameField.text, passwordField.text, endpointField.text)){
            Navigator.pushNamed(context, '/main');
          }else{
            setState(() {
              this.warningText = 'Login error';
              this.loading = true;
            });
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
