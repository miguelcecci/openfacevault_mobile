import 'dart:async';
import 'dart:convert';
import 'package:openfacevault_mobile/models/response.dart';
import 'package:http/http.dart' show Client;

class PersonsService {
  Client client = Client();

  Future<Response> getPersons(String token, String endpoint) async {

    Map<String, String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer '+token
    };

    final response = await client.get(
        'http://35.239.205.136/signin',
        headers: headers
    );

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }
}