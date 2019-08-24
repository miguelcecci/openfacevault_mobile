import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;

class UserService {
  Client client = Client();

  Future<String> doLogin(String username, String password, String endpoint) async {

    Map<String, String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Map<String, String> body = {
      'username': username,
      'password': password
    };

    final response = await client.post(
        'http://35.239.205.136/signin',
        headers: headers,
        body: jsonEncode(body)
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['token'];
    } else {
      throw Exception('Erro');
    }
  }
}