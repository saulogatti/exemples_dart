import 'package:exemplos_flutter/logs/logger_object.dart';
import 'package:exemplos_flutter/logs/utils/logger_ansi_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info_log.g.dart';

@JsonSerializable()
class InfoLog extends LoggerObjectBase {
  InfoLog(super.message) : super();
  factory InfoLog.fromJson(Map<String, dynamic> json) => _$InfoLogFromJson(json);
  @override
  LoggerAnsiColor getColor() {
    return const LoggerAnsiColor(enumAnsiColors: EnumAnsiColors.white);
  }

  @override
  Map<String, dynamic> toJson() => _$InfoLogToJson(this);
}
