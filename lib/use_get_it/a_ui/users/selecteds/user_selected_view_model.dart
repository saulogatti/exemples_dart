import 'package:exemplos_flutter/use_get_it/a_ui/users/user_view_model.dart';

class UserSelectedViewModel extends UserViewModel {
  UserSelectedViewModel({required super.repository});
  void fec() {
    repository.fetchSelectedUsers();
  }
}