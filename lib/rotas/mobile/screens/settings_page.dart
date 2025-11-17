import 'package:auto_route/auto_route.dart';
import 'package:exemplos_flutter/rotas/mobile/router/auth_guard.dart';
import 'package:exemplos_flutter/rotas/mobile/router/router.dart';
import 'package:exemplos_flutter/router_config.gr.dart';
import 'package:flutter/material.dart';
import 'package:log_custom_printer/log_custom_printer.dart';
import 'package:provider/provider.dart';

@RoutePage(name: 'SettingsTab')
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, @pathParam this.tab = 'none', @queryParam this.query = 'none'});
  final String tab;
  final String query;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutoRouteAwareStateMixin<SettingsPage>, LoggerClassMixin {
  var queryUpdateCont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.tab),
            Text(widget.query),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  queryUpdateCont++;
                });
                context.navigateTo(
                  SettingsTab(
                    tab: 'Updated Path param $queryUpdateCont',
                    query: 'updated Query $queryUpdateCont',
                  ),
                );
              },
              child: Text('Update Query $queryUpdateCont'),
            ),
            ElevatedButton(
              onPressed: () {
                context.navigateTo(BooksTab(children: [BookDetailsRoute(id: 1)]));
              },
              child: const Text('Navigate to book details/1'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthService>().logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    logDebug('did change tab route from ${previousRoute.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute? previousRoute) {
    logDebug('init tab route from ${previousRoute?.name}');
  }
}
