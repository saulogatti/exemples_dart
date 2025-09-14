import 'package:auto_route/auto_route.dart';
import 'package:exemplos_flutter/nested-navigation/nested_navigation.router.gr.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NestedNavigationApp());
}

@RoutePage()
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              context.pushRoute(SecondRoute()).then((value) => print('Pushed screen result: $value')),
          child: Text('Go to second screen'),
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
        title: Text('Host Screen'),

        /// This will automatically display a back button if the nested router can pop
        leading: AutoLeadingButton(),
      ),
      body: AutoRouter(
        builder: (context, content) {
          return Container(color: Colors.amber, child: content);
        },
      ),
    );
  }
}

class NestedNavigationApp extends StatelessWidget {
  final nestedRouter = NestedRouter();

  NestedNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: nestedRouter.config());
  }
}

@AutoRouterConfig(generateForDir: ['lib/nested-navigation'])
class NestedRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: HostRoute.page,
      children: [
        AutoRoute(page: FirstRoute.page, initial: true),
        AutoRoute(page: SecondRoute.page),
      ],
    ),
  ];
}

@RoutePage()
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: () => context.maybePop("back"), child: Text('Go Back')),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                AutoRouter.of(
                  context,
                ).pushWidget(FirstScreen()).then((value) => print('Pushed screen result: $value'));
              },
              child: Text('PUSH'),
            ),
          ),
        ],
      ),
    );
  }
}
