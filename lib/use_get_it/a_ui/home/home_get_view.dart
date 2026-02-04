import 'package:auto_route/annotations.dart';
import 'package:exemplos_flutter/use_get_it/a_ui/users/user_view_model.dart';
import 'package:exemplos_flutter/use_get_it/a_ui/users/users_view.dart';
import 'package:exemplos_flutter/use_get_it/b_core/repository/users_repository.dart';
import 'package:exemplos_flutter/use_get_it/config_dependencies.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeGetView extends StatefulWidget {
  const HomeGetView({super.key});

  @override
  State<HomeGetView> createState() => _HomeGetViewState();
}

class _HomeGetViewState extends State<HomeGetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Get It'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<UsersRepository>().fetchUsers();
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              getIt.getAll<UserViewModel>(fromAllScopes: true).forEach((viewModel) => viewModel.fetchUsers());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: const Row(
        children: [
          Flexible(child: UsersView()),
          Flexible(child: UsersView()),
        ],
      ),
    );
  }
}
