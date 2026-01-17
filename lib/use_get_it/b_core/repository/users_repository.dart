import 'package:exemplos_flutter/use_get_it/b_core/model/user_getit.dart';
import 'package:exemplos_flutter/use_get_it/c_data/service/users/user_service.dart';
import 'package:flutter/material.dart';
import 'package:log_custom_printer/log_custom_printer.dart';

export 'package:exemplos_flutter/use_get_it/b_core/model/user_getit.dart';

class UsersRepository {
  UsersRepository(this._userService) {
    _logger.logDebug('UsersRepository created');
  }
  final _LoggerUsersRepository _logger = _LoggerUsersRepository();
  final UserService _userService;
  final List<UserGetit> _listUsers = <UserGetit>[];
  final errorMessage = ValueNotifier<String?>(null);
  ValueNotifier<List<UserGetit>> listUsers = ValueNotifier(<UserGetit>[]);
  Future<void> fetchUsers() async {
    final result = await _userService.getUsers();
    result.fold(
      onSuccess: (users) {
        _listUsers
          ..clear()
          ..addAll(users);
        listUsers.value = List.unmodifiable(_listUsers);
      },
      onFailure: (error) {
        errorMessage.value = error.toString();
        _logger.logDebug('Error fetching users: ${error.toString()}');
      },
    );
  }

  void updateUser(UserGetit user) {
    _userService.saveUser(user);
    final index = _listUsers.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _listUsers[index] = user;
      listUsers.value = List.unmodifiable(_listUsers);
    }
  }
}

class _LoggerUsersRepository with LoggerClassMixin {}
