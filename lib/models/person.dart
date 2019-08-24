import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'photo')
  String photo;

  @JsonKey(name: 'created_date')
  String createdDate;

  Person(this.name, this.id, this.photo, this.createdDate);

  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}