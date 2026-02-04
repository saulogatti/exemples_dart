import 'package:exemplos_flutter/use_get_it/b_core/repository/users_repository.dart';
import 'package:flutter_it/flutter_it.dart';

class UserViewModel {
  UserViewModel({required UsersRepository repository}) : _repository = repository;
  final UsersRepository _repository;
  late final Command<void, List<UserGetit>> command = Command.createAsyncNoParam<List<UserGetit>>(
    _repository.fetchSelectedUsers,
    initialValue: List.empty(),
  );
  UsersRepository get repository => _repository;

  void fetchUsers() {
    command.run();
  }

  void updateUser(UserGetit user) {
    _repository.updateUser(user);
    fetchUsers();
  }
}
