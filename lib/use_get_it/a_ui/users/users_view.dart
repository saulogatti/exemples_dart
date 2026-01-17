import 'package:exemplos_flutter/use_get_it/b_core/repository/users_repository.dart';
import 'package:exemplos_flutter/use_get_it/config_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class UsersView extends WatchingWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = watchValue((UsersRepository repo) => repo.listUsers);
    return ListView.builder(
      itemCount: list.length,
      semanticChildCount: list.length,
      itemBuilder: (context, index) {
        final user = list[index];

        return CheckboxListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
          value: user.isChecked,
          onChanged: (bool? value) {
            user.isChecked = value ?? false;
            getIt<UsersRepository>().updateUser(user);
          },
        );
      },
    );
  }
}
