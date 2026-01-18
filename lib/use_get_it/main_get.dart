import 'package:exemplos_flutter/use_get_it/config_dependencies.dart';
import 'package:exemplos_flutter/use_get_it/rotas_get.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MainGet());
}

class MainGet extends StatelessWidget {
  const MainGet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Exemplos Flutter - Get It',
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      routerConfig: getIt<RotasGet>().config(),
    );
  }
}
