// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map json) {
  return Person(
    json['name'] as String,
    json['id'] as int,
    json['photo'] as String,
    json['created_date'] as String,
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'photo': instance.photo,
      'created_date': instance.created_date,
    };
