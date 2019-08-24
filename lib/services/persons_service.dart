import 'dart:async';
import 'dart:convert';
import 'package:openfacevault_mobile/models/response.dart';
import 'package:http/http.dart' show Client;

class PersonsService {
  Client client = Client();

  Future<List> getPersons(String token, String endpoint) async {

    Map<String, String> headers = {
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbiI6ImQxYzdmMjMwLWY1NTQtNGJhYS05ZTAwLTZhZTc4YzcyMmUyMiIsImV4cCI6MTU2NjYzNzUxNX0.Rs7mzFZK5x8hnSYZSPY7ad1sOaYp4YXAJ4H9w1vpZ-U',
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    final response = await client.get(
        'http://35.239.205.136/person',
        headers: headers
    );
    print(response.statusCode);


    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body)).persons;
    } else {
      throw Exception('Erro');
    }
  }
}