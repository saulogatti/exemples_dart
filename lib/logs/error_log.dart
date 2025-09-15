import 'package:exemplos_flutter/logs/logger_object.dart';
import 'package:exemplos_flutter/logs/utils/logger_ansi_color.dart';
import 'package:exemplos_flutter/logs/utils/stack_trace_extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_log.g.dart';

@JsonSerializable()
class ErrorLog extends LoggerObjectBase {
  ErrorLog(super.message, this.stackTrace) : super();
  factory ErrorLog.fromJson(Map<String, dynamic> json) => _$ErrorLogFromJson(json);
  @StackTraceConverter()
  final StackTrace stackTrace;
  @override
  LoggerAnsiColor getColor() {
    return const LoggerAnsiColor(enumAnsiColors: EnumAnsiColors.red);
  }

  @override
  String getMessage([bool withColor = true]) {
    final str = stackTrace.stackInMap(100);
    final color = getColor();
    final strMessage = super
        .getMessage(withColor)
        .split("\n")
        .map((e) => withColor ? color.call(e) : e)
        .toList();

    for (final element in str.keys) {
      if (withColor) {
        strMessage.add(color.call("$element = ${str[element]}"));
      } else {
        strMessage.add("$element = ${str[element]}");
      }
    }

    return strMessage.join("\n\t");
  }

  @override
  Map<String, dynamic> toJson() => _$ErrorLogToJson(this);
}

class StackTraceConverter implements JsonConverter<StackTrace, String> {
  const StackTraceConverter();

  @override
  StackTrace fromJson(String json) {
    // Implement your deserialization logic here
    return StackTrace.fromString(json);
  }

  @override
  String toJson(StackTrace object) {
    // Implemente sua lógica de serialização aqui
    return object.toString();
  }
}
