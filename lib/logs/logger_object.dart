import 'package:exemplos_flutter/logs/printer/logger_printer.dart';
import 'package:exemplos_flutter/logs/utils/logger_ansi_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logger_object.g.dart';

sealed class LoggerObject {}

@JsonSerializable(createFactory: false)
abstract class LoggerObjectBase extends LoggerObject {
  LoggerObjectBase(this.message) {
    creationDateTime = DateTime.now();
    updatedDateTime = DateTime.now();
  }
  final String message;
  late DateTime creationDateTime;
  late DateTime updatedDateTime;
  @JsonKey(defaultValue: "")
  String classLog = "";
  LoggerAnsiColor getColor();
  String getMessage([bool withColor = true]) {
    final messageFormated = "${creationDateTime.toString()} $message";
    final String messa = withColor ? getColor().call(messageFormated) : message;

    return messa;
  }

  String getStartLog([bool withColor = true]) {
    if (withColor) {
      return getColor().call(
        runtimeType.toString().toUpperCase() + (classLog.isNotEmpty ? " - $classLog".toUpperCase() : ""),
      );
    }
    return runtimeType.toString().toUpperCase() + (classLog.isNotEmpty ? " - $classLog".toUpperCase() : "");
  }

  void sendLog() {
    LoggerPrinter().logObject(this);
  }

  Map<String, dynamic> toJson() => _$LoggerObjectBaseToJson(this);

  @override
  String toString() {
    return getMessage();
  }
}
