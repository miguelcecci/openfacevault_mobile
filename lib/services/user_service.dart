import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;

class UserService {
  Client client = Client();

  Future<String> doLogin(String username, String password, String endpoint) async {
    Map<String, dynamic> body = {'username': username, 'password': password};
    final response = await client.post('http://'+endpoint+'/signin', body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body)['token'];
    } else {
      throw Exception('Erro');
    }
  }
}