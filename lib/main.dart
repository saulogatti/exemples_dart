import 'package:auto_route/auto_route.dart';
import 'package:exemplos_flutter/rotas/data/db.dart';
import 'package:exemplos_flutter/rotas/mobile/router/auth_guard.dart';
import 'package:exemplos_flutter/rotas/mobile/router/router.dart';
import 'package:exemplos_flutter/router_config.dart';
import 'package:exemplos_flutter/test_fonts/cache_font.dart';
import 'package:flutter/material.dart';
import 'package:log_custom_printer/log_custom_printer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cacheBackend.initialize();
  await cacheBackendClassA.initialize();
  if (executeRoutes) {
    runApp(const MyAppRoutes());
  } else {
    runApp(const MyApp());
  }
}

CacheBackend cacheBackend = CacheBackend();
CacheBackendClassA cacheBackendClassA = CacheBackendClassA();
bool executeRoutes = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class MyAppRoutes extends StatefulWidget {
  const MyAppRoutes({super.key});

  @override
  State<MyAppRoutes> createState() => _MyAppRoutesState();
}

class _MyAppRoutesState extends State<MyAppRoutes> {
  final authService = AuthService();

  late final _rootRouter = AppRouter(authService);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _rootRouter.config(
        reevaluateListenable: authService,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      theme: ThemeData.light(),
      builder: (_, router) {
        return ChangeNotifierProvider<AuthService>(
          create: (_) => authService,
          child: BooksDBProvider(child: router!),
        );
      },
    );
  }

  @override
  void initState() {
    LogCustomPrinterBase.colorPrint();
    super.initState();
  }
}

class _MyAppState extends State<MyApp> {
  final ExemplosRouter config = ExemplosRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: config.config(), title: 'Flutter Exemplos');
  }

  @override
  void initState() {
    LogCustomPrinterBase.colorPrint();
    LogDisplayHandler();
    super.initState();
  }
}
