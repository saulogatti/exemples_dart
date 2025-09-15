import 'package:exemplos_flutter/logs/logger_object.dart';
import 'package:exemplos_flutter/logs/utils/logger_ansi_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'debug_log.g.dart';

@JsonSerializable()
class DebugLog extends LoggerObjectBase {
  DebugLog(super.message);

  factory DebugLog.fromJson(Map<String, dynamic> json) => _$DebugLogFromJson(json);

  @override
  LoggerAnsiColor getColor() {
    return const LoggerAnsiColor(enumAnsiColors: EnumAnsiColors.cyan);
  }

  @override
  Map<String, dynamic> toJson() => _$DebugLogToJson(this);
}
