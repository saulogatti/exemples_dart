import 'package:auto_route/auto_route.dart';
import 'package:exemplos_flutter/logs/widget/exemplo_erros.dart';
import 'package:exemplos_flutter/router_config.gr.dart';
import 'package:exemplos_flutter/test_fonts/test_fonts.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Flutter Demo Home Page'),
        leading: const AutoLeadingButton(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList.list(
              itemExtent: 50,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.font_download_outlined),
                  label: const Text('Teste de Fontes'),
                  onPressed: () {
                    // Adiciona uma nova rota na pilha de navegação Widget
                    AutoRouter.of(context).pushWidget(const TestFonts());
                  },
                ),
                ActionChip(
                  avatar: const Icon(Icons.route_outlined),
                  label: const Text('Teste de Rotas'),
                  onPressed: () {
                    // Adiciona uma nova rota na pilha de navegação Widget
                    AutoRouter.of(context).push(const HostRoute());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).pushWidget(const ExemploErros());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
