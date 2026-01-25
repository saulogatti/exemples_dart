// data/repositories/user_repository_impl.dart
import 'package:exemplos_flutter/clean_code/data/datasources/user_remote_datasource.dart';
import 'package:exemplos_flutter/clean_code/domain/entities/user_entity.dart';
import 'package:exemplos_flutter/clean_code/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.datasource);
  final UserRemoteDataSource datasource;

  @override
  Future<List<UserEntity>> getUsers() async {
    return datasource.getUsers();
  }
}
