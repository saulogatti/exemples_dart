// presentation/bloc/user_state.dart
import 'package:exemplos_flutter/clean_code/domain/entities/user_entity.dart';

class UserError extends UserState {
  UserError(this.message);
  final String message;
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  UserLoaded(this.users);
  final List<UserEntity> users;
}

class UserLoading extends UserState {}

abstract class UserState {}
