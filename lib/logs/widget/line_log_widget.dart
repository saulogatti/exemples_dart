
import 'package:exemplos_flutter/logs/widget/details_error.dart';
import 'package:flutter/material.dart';
import 'package:log_custom_printer/log_custom_printer.dart';

class LineLogWidget extends StatelessWidget {
  const LineLogWidget({required this.log, required this.index, super.key});
  final LoggerObjectBase log;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      shadowColor: Colors.white,
      elevation: 2,
      color: Colors.black,
      margin: const EdgeInsets.all(6),
      child: ListTile(
        titleTextStyle: TextStyle(
          color: log.getColor().enumAnsiColors.getWidgetColor(),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        subtitleTextStyle: TextStyle(
          color: log.getColor().enumAnsiColors.getWidgetColor(),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        contentPadding: EdgeInsets.zero,
        isThreeLine: false,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => DetailsError(log: log)));
        },
        titleAlignment: ListTileTitleAlignment.top,
        subtitle: Text(
          textAlign: TextAlign.left,
          log.getMessage(false),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.center,
            "#$index - ${log.getStartLog(false)} ${log.logCreationDate.onlyTime()}".toUpperCase(),
          ),
        ),
        leading: IconButton(
          iconSize: 20,
          padding: EdgeInsets.zero,
          onPressed: () => LogDisplayHandler().clearList(type: log.enumLoggerType, index: index),
          icon: const Icon(Icons.clear),
          color: Colors.white,
        ),
      ),
    );
  }
}
