import 'package:exemplos_flutter/use_get_it/b_core/repository/users_repository.dart';
import 'package:exemplos_flutter/use_get_it/c_data/service/app_service.dart';
import 'package:exemplos_flutter/use_get_it/c_data/service/users/user_service.dart';
import 'package:exemplos_flutter/use_get_it/rotas_get.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void configureDependencies() {
  getIt.registerSingleton<RotasGet>(RotasGet());
  getIt.registerSingleton<AppService>(LocalAppService());
  getIt.registerLazySingleton<UserService>(() => UserService(getIt<AppService>()));
  getIt.registerLazySingleton<UsersRepository>(() => UsersRepository(getIt<UserService>()));
}
