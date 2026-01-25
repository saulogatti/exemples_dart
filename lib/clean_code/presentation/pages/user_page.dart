// presentation/pages/user_page.dart
import 'package:exemplos_flutter/clean_code/presentation/bloc/user_bloc.dart';
import 'package:exemplos_flutter/clean_code/presentation/bloc/user_event.dart';
import 'package:exemplos_flutter/clean_code/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuários')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            context.read<UserBloc>().add(LoadUsersEvent());
            return const Center(child: Text('Iniciando...'));
          }

          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_, i) {
                final user = state.users[i];
                return ListTile(title: Text(user.name), subtitle: Text(user.email));
              },
            );
          }

          if (state is UserError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
