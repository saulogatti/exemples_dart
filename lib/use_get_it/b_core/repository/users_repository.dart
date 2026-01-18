import 'package:exemplos_flutter/use_get_it/b_core/model/user_getit.dart';
import 'package:exemplos_flutter/use_get_it/c_data/service/users/user_service.dart';
import 'package:log_custom_printer/log_custom_printer.dart';
import 'package:typed_cache/typed_cache.dart';

export 'package:exemplos_flutter/use_get_it/b_core/model/user_getit.dart';

class UsersRepository {
  UsersRepository(this._userService) {
    _logger.logDebug('UsersRepository created');
  }
  final _LoggerUsersRepository _logger = _LoggerUsersRepository();
  final UserService _userService;
  Future<Result<List<UserGetit>, String>> fetchUsers() async {
    try {
      final result = await _userService.getUsers();
      return Success(result);
    } on Exception catch (e) {
      _logger.logError('Error fetching users $e', StackTrace.current);
      return Failure(e.toString());
    }
  }
  Future<List<UserGetit>> fetchSelectedUsers() async {
    final result = await _userService.getUsers();
    return result;
  }

  Future<Result<bool, String>> updateUser(UserGetit user) async {
    try {
      final bool result = await _userService.saveUser(user);

      return Success(result);
    } on Exception catch (e, stackTrace) {
      _logger.logError('Error saving user ${user.id} $e', stackTrace);
      return Failure(e.toString());
    }
  }
}

class _LoggerUsersRepository with LoggerClassMixin {}
