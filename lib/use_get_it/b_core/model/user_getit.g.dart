// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_getit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGetit _$UserGetitFromJson(Map<String, dynamic> json) => UserGetit(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  isChecked: json['isChecked'] as bool? ?? false,
);

Map<String, dynamic> _$UserGetitToJson(UserGetit instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'isChecked': instance.isChecked,
};
