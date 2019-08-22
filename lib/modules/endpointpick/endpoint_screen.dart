import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EndpointScreen extends StatefulWidget {
  @override
  _EndpointScreenState createState() => _EndpointScreenState();
}

class _EndpointScreenState extends State<EndpointScreen> {

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  _setEndpointAddress(String endpoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('endpoint', endpoint);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Wellcome to OpenFaceVault add your endpoint to start:'),
              Container(
                padding: EdgeInsets.all(50),
                child: TextField(
                  controller: myController,
                ),
              ),
              Text('Instructions to run an endpoint')
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _setEndpointAddress(myController.text).then(
              Navigator.pushNamed(context, '/login')
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
