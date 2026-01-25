// domain/repositories/user_repository.dart
import 'package:exemplos_flutter/clean_code/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}
