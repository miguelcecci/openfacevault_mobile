import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'status')
  bool status;

  Response(this.message, this.token, this.status);

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}