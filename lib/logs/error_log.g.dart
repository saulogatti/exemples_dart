// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorLog _$ErrorLogFromJson(Map<String, dynamic> json) =>
    ErrorLog(
        json['message'] as String,
        const StackTraceConverter().fromJson(json['stackTrace'] as String),
      )
      ..creationDateTime = DateTime.parse(json['creationDateTime'] as String)
      ..updatedDateTime = DateTime.parse(json['updatedDateTime'] as String)
      ..classLog = json['classLog'] as String? ?? '';

Map<String, dynamic> _$ErrorLogToJson(ErrorLog instance) => <String, dynamic>{
  'message': instance.message,
  'creationDateTime': instance.creationDateTime.toIso8601String(),
  'updatedDateTime': instance.updatedDateTime.toIso8601String(),
  'classLog': instance.classLog,
  'stackTrace': const StackTraceConverter().toJson(instance.stackTrace),
};
