import 'package:auto_route/auto_route.dart';
import 'package:exemplos_flutter/router_config.gr.dart';

@AutoRouterConfig()
class ExemplosRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(initial: true, page: MyHomeRoute.page),
    AutoRoute(
      page: HostRoute.page,
      children: [
        AutoRoute(page: FirstRoute.page, initial: true),
        AutoRoute(page: SecondRoute.page),
      ],
    ),
  ];
}
