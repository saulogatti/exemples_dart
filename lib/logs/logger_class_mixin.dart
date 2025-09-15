import 'package:exemplos_flutter/logs/debug_log.dart';
import 'package:exemplos_flutter/logs/error_log.dart';
import 'package:exemplos_flutter/logs/info_log.dart';
import 'package:exemplos_flutter/logs/warning_log.dart';
/// Mixin para adicionar funcionalidades de logging a uma classe.
mixin LoggerClassMixin {
  void debugDispose() {
    InfoLog('Dispose $runtimeType').sendLog();
  }

  void logDebug(String message) {
    final log = DebugLog(message);
    log.classLog = runtimeType.toString();
    log.sendLog();
  }

  void logError(String message, StackTrace stackTrace) {
    final log = ErrorLog(message, stackTrace);
    log.classLog = runtimeType.toString();
    log.sendLog();
  }

  void logInfo(String message) {
    final log = InfoLog(message);
    log.classLog = runtimeType.toString();
    log.sendLog();
  }

  void logWarning(String message) {
    final log = WarningLog(message);
    log.classLog = runtimeType.toString();
    log.sendLog();
  }
}
