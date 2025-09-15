
# Copilot Instructions for `exemples_dart`

## Visão Geral
Este repositório contém exemplos Dart/Flutter focados em navegação (auto_route), rotas declarativas, fontes customizadas e padrões de organização modular. O objetivo é demonstrar técnicas de navegação, gerenciamento de rotas e uso de recursos customizados em Flutter.

## Estrutura e Componentes
- `lib/` contém todos os exemplos, organizados por tema:
  - `rotas/mobile/`, `rotas/declarative/`, `routes_simples/`: Exemplos de navegação e rotas.
  - `assets_gen/fonts.gen.dart` e `test_fonts/`: Demonstração de uso de fontes customizadas.
  - `router_config.dart` e `.gr.dart`: Configuração central de rotas.
- Cada exemplo é isolado em seu subdiretório, facilitando a navegação e manutenção.

## Navegação e Rotas
- O projeto utiliza o pacote `auto_route` para navegação declarativa e aninhada.
- Rotas são definidas em classes com `@AutoRouterConfig` e organizadas em arquivos como `router_config.dart` e `rotas/mobile/router/router.dart`.
- Telas usam `context.pushRoute(...)` ou `AutoRouter.of(context).pushWidget(...)` para navegação.
- Exemplo:
  ```dart
  context.pushRoute(const SecondRoute());
  AutoRouter.of(context).pushWidget(const TestFonts());
  ```
- Rotas aninhadas e guards de autenticação são demonstrados em `rotas/mobile/router/router.dart`.

## Fontes Customizadas
- Fontes são organizadas em `assets/fonts/` e gerenciadas via arquivos `.gen.dart`.
- O exemplo de uso está em `test_fonts/test_fonts.dart` e acionado por um `ActionChip` em `my_home_page.dart`.

## Comandos Essenciais
- Instale dependências: `flutter pub get`
- Rode o app: `flutter run`
- Atualize dependências: `flutter pub upgrade`
- Não há testes automatizados por padrão; crie arquivos em `test/` se necessário.

## Convenções e Padrões
- Siga [Effective Dart](https://dart.dev/effective-dart) para estilo e documentação.
- Nomes de arquivos: `lowercase_with_underscores`.
- Cada exemplo deve ser modular e isolado.
- Use sempre navegação declarativa e centralize rotas em arquivos `.dart` dedicados.

## Integrações
- `auto_route` para navegação.
- `provider` para gerenciamento de estado em exemplos específicos.

## Exemplos de Código
- Definição de rota:
  ```dart
  @AutoRouterConfig()
  class ExemplosRouter extends RootStackRouter {
    @override
    List<AutoRoute> get routes => [
      AutoRoute(initial: true, page: MyHomeRoute.page),
      AutoRoute(page: HostRoute.page, children: [
        AutoRoute(page: FirstRoute.page, initial: true),
        AutoRoute(page: SecondRoute.page),
      ]),
    ];
  }
  ```
- Navegação entre telas:
  ```dart
  context.pushRoute(const SecondRoute());
  AutoRouter.of(context).pushWidget(const TestFonts());
  ```

## Recomendações para agentes AI
- Sempre siga os padrões de navegação e modularização já presentes.
- Consulte `router_config.dart` e subdiretórios de `rotas/` para exemplos reais.
- Atualize este arquivo se novos padrões ou fluxos forem introduzidos.
