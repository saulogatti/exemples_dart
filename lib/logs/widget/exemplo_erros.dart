import 'package:exemplos_flutter/logs/widget/line_log_widget.dart';
import 'package:exemplos_flutter/logs/widget/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:log_custom_printer/log_custom_printer.dart';

const listLog = EnumLoggerType.values;

class ExemploErros extends StatefulWidget {
  const ExemploErros({super.key});

  @override
  State<ExemploErros> createState() => _ExemploErrosState();
}

class _ExemploErrosState extends State<ExemploErros> with LoggerClassMixin {
  final ValueNotifier<EnumLoggerType> _selectedLogType = ValueNotifier(EnumLoggerType.error);
  List<LoggerObjectBase> _filteredLogs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,

            title: ValueListenableBuilder(
              valueListenable: _selectedLogType,
              builder: (context, value, child) {
                return DropdownButtonLog(
                  dropdownValue: value,
                  onChanged: (value) {
                    _filteredLogs = LogDisplayHandler().getLogsType(value!);
                    _selectedLogType.value = value;
                  },
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final log = listLog[index];
              return ActionChip(
                label: Text(log.name.toString().toUpperCase()),
                onPressed: () {
                  final String message = "Enviando log de ${log.name} via ActionChip";
                  switch (log) {
                    case EnumLoggerType.error:
                      logError(message, StackTrace.current);
                    case EnumLoggerType.debug:
                      logDebug(message);
                    case EnumLoggerType.warning:
                      logWarning(message);
                    case EnumLoggerType.info:
                      logInfo(message);
                  }
                },
              );
            }, childCount: listLog.length),
          ),
          ValueListenableBuilder(
            valueListenable: _selectedLogType,
            builder: (context, value, child) {
              return SliverList.separated(
                itemBuilder: (context, index) {
                  final log = _filteredLogs[index];
                  return LineLogWidget(log: log, index: index);
                },
                separatorBuilder: (context, index) {
                  return const Divider(color: Colors.white);
                },
                itemCount: _filteredLogs.length,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ExemploErros oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    debugDispose();

    super.dispose();
  }

  @override
  void initState() {
    _filteredLogs = LogDisplayHandler().getLogsType(EnumLoggerType.error);
    LogDisplayHandler().notifier.addListener(() {
      setState(() {
        _filteredLogs = LogDisplayHandler().getLogsType(_selectedLogType.value);
      });
    });
    super.initState();
  }
}
