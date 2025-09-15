// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debug_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DebugLog _$DebugLogFromJson(Map<String, dynamic> json) =>
    DebugLog(json['message'] as String)
      ..creationDateTime = DateTime.parse(json['creationDateTime'] as String)
      ..updatedDateTime = DateTime.parse(json['updatedDateTime'] as String)
      ..classLog = json['classLog'] as String? ?? '';

Map<String, dynamic> _$DebugLogToJson(DebugLog instance) => <String, dynamic>{
  'message': instance.message,
  'creationDateTime': instance.creationDateTime.toIso8601String(),
  'updatedDateTime': instance.updatedDateTime.toIso8601String(),
  'classLog': instance.classLog,
};
