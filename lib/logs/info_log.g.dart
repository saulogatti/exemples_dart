// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoLog _$InfoLogFromJson(Map<String, dynamic> json) =>
    InfoLog(json['message'] as String)
      ..creationDateTime = DateTime.parse(json['creationDateTime'] as String)
      ..updatedDateTime = DateTime.parse(json['updatedDateTime'] as String)
      ..classLog = json['classLog'] as String? ?? '';

Map<String, dynamic> _$InfoLogToJson(InfoLog instance) => <String, dynamic>{
  'message': instance.message,
  'creationDateTime': instance.creationDateTime.toIso8601String(),
  'updatedDateTime': instance.updatedDateTime.toIso8601String(),
  'classLog': instance.classLog,
};
