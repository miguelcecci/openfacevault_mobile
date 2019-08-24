// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map json) {
  return Response(
    (json['persons'] as List)
        ?.map((e) => e == null
            ? null
            : Person.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    json['message'] as String,
    json['access_token'] as String,
    json['status'] as int,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'message': instance.message,
      'access_token': instance.token,
      'status': instance.status,
      'persons': instance.persons,
    };
