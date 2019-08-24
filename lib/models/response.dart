import 'package:json_annotation/json_annotation.dart';
import 'package:openfacevault_mobile/models/person.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'access_token')
  String token;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'persons')
  List<Person> persons;

  Response( this.persons, this.message, this.token, this.status);

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}