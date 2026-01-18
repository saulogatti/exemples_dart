import 'package:exemplos_flutter/use_get_it/b_core/model/user_getit.dart';
import 'package:exemplos_flutter/use_get_it/c_data/service/app_service.dart';

class UserService {
  UserService(this._appService);
  final AppService _appService;

  Future<List<UserGetit>> getUsers() async {
    try {
      final db = _appService.getDatabase();
      final users = db.map(UserGetit.fromJson).toList();
      return users;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> saveUser(UserGetit user) async {
    try {
      final key = user.id.toString();
      final data = user.toJson();
      await _appService.save(key, data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
