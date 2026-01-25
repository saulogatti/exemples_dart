// presentation/bloc/user_bloc.dart
import 'package:exemplos_flutter/clean_code/domain/usecases/get_users.dart';
import 'package:exemplos_flutter/clean_code/presentation/bloc/user_event.dart';
import 'package:exemplos_flutter/clean_code/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.getUsers) : super(UserInitial()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError('Erro ao carregar usuários'));
      }
    });
  }
  final GetUsers getUsers;
}
