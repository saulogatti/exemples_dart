import 'package:exemplos_flutter/logs/logger_object.dart';
import 'package:exemplos_flutter/logs/utils/logger_ansi_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warning_log.g.dart';

@JsonSerializable()
class WarningLog extends LoggerObjectBase {
  WarningLog(super.message) : super();

  factory WarningLog.fromJson(Map<String, dynamic> json) => _$WarningLogFromJson(json);

  @override
  LoggerAnsiColor getColor() {
    return const LoggerAnsiColor(enumAnsiColors: EnumAnsiColors.yellow);
  }

  @override
  Map<String, dynamic> toJson() => _$WarningLogToJson(this);
}
