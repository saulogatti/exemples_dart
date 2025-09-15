// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarningLog _$WarningLogFromJson(Map<String, dynamic> json) =>
    WarningLog(json['message'] as String)
      ..creationDateTime = DateTime.parse(json['creationDateTime'] as String)
      ..updatedDateTime = DateTime.parse(json['updatedDateTime'] as String)
      ..classLog = json['classLog'] as String? ?? '';

Map<String, dynamic> _$WarningLogToJson(WarningLog instance) =>
    <String, dynamic>{
      'message': instance.message,
      'creationDateTime': instance.creationDateTime.toIso8601String(),
      'updatedDateTime': instance.updatedDateTime.toIso8601String(),
      'classLog': instance.classLog,
    };
