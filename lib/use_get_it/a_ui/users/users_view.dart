import 'package:exemplos_flutter/use_get_it/a_ui/users/user_view_model.dart';
import 'package:exemplos_flutter/use_get_it/b_core/repository/users_repository.dart';
import 'package:exemplos_flutter/use_get_it/config_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

class UsersView extends WatchingWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    pushScope(
      init: (getIt) {
        getIt.registerSingleton(UserViewModel(repository: getIt<UsersRepository>()));
      },
    );
    final model = watchValue((UserViewModel value) {
      return value.command;
    });

    return ListView.builder(
      itemCount: model.length,
      semanticChildCount: model.length,
      itemBuilder: (context, index) {
        final user = model[index];

        return CheckboxListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
          value: user.isChecked,
          onChanged: (bool? value) {
            user.isChecked = value ?? false;
getIt<UserViewModel>() .updateUser(user);
          },
        );
      },
    );
  }
}
