// domain/usecases/get_users.dart
import 'package:exemplos_flutter/clean_code/domain/entities/user_entity.dart';
import 'package:exemplos_flutter/clean_code/domain/repositories/user_repository.dart';

class GetUsers {
  GetUsers(this.repository);
  final UserRepository repository;

  Future<List<UserEntity>> call() async {
    return repository.getUsers();
  }
}
