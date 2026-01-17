import 'package:auto_route/auto_route.dart';
import 'package:exemplos_flutter/use_get_it/rotas_get.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|View,Route')
class RotasGet extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [AutoRoute(initial: true, page: HomeGetRoute.page)];
}
