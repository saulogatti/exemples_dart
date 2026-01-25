import 'package:dio/dio.dart';
import 'package:exemplos_flutter/clean_code/data/datasources/user_remote_datasource.dart';
import 'package:exemplos_flutter/clean_code/data/repositories/user_repository_impl.dart';
import 'package:exemplos_flutter/clean_code/domain/repositories/user_repository.dart';
import 'package:exemplos_flutter/clean_code/domain/usecases/get_users.dart';
import 'package:get_it/get_it.dart';

final dependency = GetIt.instance;

void setupDependencies() {
  dependency.registerLazySingleton(Dio.new);
  dependency.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(dependency<Dio>()));
  dependency.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(dependency<UserRemoteDataSource>()),
  );
  dependency.registerLazySingleton<GetUsers>(() => GetUsers(dependency<UserRepository>()));
}
