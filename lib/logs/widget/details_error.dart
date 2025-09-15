import 'package:exemplos_flutter/logs/logger_object.dart';
import 'package:flutter/material.dart';

class DetailsError extends StatelessWidget {
  const DetailsError({required this.log, super.key});

  final LoggerObjectBase log;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Message:", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text(
                  log.getMessage(false),
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
