import 'dart:async';
import 'dart:convert';
import 'package:openfacevault_mobile/models/response.dart';
import 'package:openfacevault_mobile/models/person.dart';
import 'package:http/http.dart' show Client;

class PersonsService {
  Client client = Client();

  Future<Response> getPersons(String token, String endpoint) async {

    Map<String, String> headers = {
      'Authorization': 'Bearer '+token,
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    final response = await client.get(
        'http://35.239.205.136/person',
        headers: headers
    );

    try{ Response.fromJson(json.decode(response.body)); }
    catch(e){
      print(e);
    }

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }
}