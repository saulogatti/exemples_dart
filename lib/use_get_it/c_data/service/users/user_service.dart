import 'package:exemplos_flutter/use_get_it/b_core/model/user_getit.dart';
import 'package:exemplos_flutter/use_get_it/c_data/service/app_service.dart';
import 'package:typed_cache/typed_cache.dart';

class UserService {
  UserService(this._appService);
  final AppService _appService;

  Future<Result<List<UserGetit>, Exception>> getUsers() async {
    try {
      final db = _appService.getDatabase();
      final users = db.map(UserGetit.fromJson).toList();
      return Result.success(users);
    } catch (e) {
      return Result.failure(Exception('Failed to fetch users: $e'));
    }
  }
  Future<void> saveUser(UserGetit user) async {
    final key = user.id.toString();
    final data = user.toJson();
    await _appService.save(key, data);
  }
}
