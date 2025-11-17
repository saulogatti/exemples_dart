import 'package:auto_route/auto_route.dart';
import 'package:exemplos_flutter/router_config.gr.dart';
import 'package:flutter/material.dart';
import 'package:log_custom_printer/log_custom_printer.dart';

@RoutePage()
class FirstScreen extends StatelessWidget with LoggerClassMixin {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: ElevatedButton(
          onPressed: () => context
              .pushRoute(const SecondRoute())
              .then((value) => logDebug('Pushed screen result: $value')),
          child: const Text('Go to second screen'),
        ),
      ),
    );
  }
}

@RoutePage()
class HostScreen extends StatelessWidget {
  const HostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotas Simples'),

        /// This will automatically display a back button if the nested router can pop
        leading: const AutoLeadingButton(),
      ),
      body: AutoRouter(
        builder: (context, content) {
          return ColoredBox(color: Colors.amber, child: content);
        },
      ),
    );
  }
}

@RoutePage()
class SecondScreen extends StatelessWidget with LoggerClassMixin {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: () => context.maybePop("back"), child: const Text('Go Back')),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                AutoRouter.of(
                  context,
                ).pushWidget(const FirstScreen()).then((value) => logDebug('Pushed screen result: $value'));
              },
              child: const Text('PUSH'),
            ),
          ),
        ],
      ),
    );
  }
}
