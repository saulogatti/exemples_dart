import 'package:flutter/material.dart';

class UserViewModel {
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  ValueNotifier<String> userName = ValueNotifier<String>('');
  ValueNotifier<String> userEmail = ValueNotifier<String>('');
}
