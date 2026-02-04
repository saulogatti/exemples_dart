import 'package:exemplos_flutter/clean_code/domain/usecases/get_users.dart';
import 'package:exemplos_flutter/clean_code/injection/dependency_injector.dart';
import 'package:exemplos_flutter/clean_code/presentation/bloc/user_bloc.dart';
import 'package:exemplos_flutter/clean_code/presentation/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupDependencies();
  runApp(MyApp(getUsers: dependency<GetUsers>()));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.getUsers, super.key});
  final GetUsers getUsers;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_) => UserBloc(getUsers), child: const UserPage()),
    );
  }
}
