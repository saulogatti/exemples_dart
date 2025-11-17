import 'package:exemplos_flutter/logs/widget/line_log_widget.dart';
import 'package:flutter/material.dart';
import 'package:log_custom_printer/log_custom_printer.dart';

class DropdownButtonLog extends StatefulWidget {
  const DropdownButtonLog({required this.dropdownValue, super.key, this.onChanged});
  final void Function(EnumLoggerType?)? onChanged;
  final EnumLoggerType dropdownValue;

  @override
  State<DropdownButtonLog> createState() => _DropdownButtonExampleState();
}

class LogWidget extends StatefulWidget {
  const LogWidget({super.key});

  @override
  State<LogWidget> createState() => _LogWidgetState();
}

class _DropdownButtonExampleState extends State<DropdownButtonLog> {
  final list = EnumLoggerType.values;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<EnumLoggerType>(
          enableFeedback: true,
          dropdownColor: Colors.black,
          value: widget.dropdownValue,
          icon: const Icon(Icons.arrow_downward_sharp),
          elevation: 16,
          style: const TextStyle(color: Colors.white),
          underline: Container(height: 2, color: Colors.white),
          onChanged: (EnumLoggerType? value) {
            // This is called when the user selects an item.
            widget.onChanged?.call(value);
          },
          items: list.map<DropdownMenuItem<EnumLoggerType>>((EnumLoggerType value) {
            return DropdownMenuItem<EnumLoggerType>(
              value: value,
              child: Text(value.name.toUpperCase(), textAlign: TextAlign.center),
            );
          }).toList(),
        ),
        IconButton(
          alignment: Alignment.center,
          onPressed: () => setState(() {
            LogDisplayHandler().clearList(type: widget.dropdownValue);
          }),
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }
}

class _LogWidgetState extends State<LogWidget> {
  final ValueNotifier<EnumLoggerType> _selectedLogType = ValueNotifier(EnumLoggerType.debug);
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
  void initState() {
    _filteredLogs = LogDisplayHandler().getLogsType(EnumLoggerType.debug);
    LogDisplayHandler().notifier.addListener(() {
      setState(() {
        _filteredLogs = LogDisplayHandler().getLogsType(_selectedLogType.value);
      });
    });
    super.initState();
  }
}
