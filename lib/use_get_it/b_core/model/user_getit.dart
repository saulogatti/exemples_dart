import 'package:json_annotation/json_annotation.dart';

part 'user_getit.g.dart';

@JsonSerializable()
class UserGetit {
  UserGetit({required this.id, required this.name, required this.email, this.isChecked = false});

  factory UserGetit.fromJson(Map<String, dynamic> map) => _$UserGetitFromJson(map);
  final int id;
  final String name;
  final String email;
  bool isChecked;
  Map<String, dynamic> toJson() => _$UserGetitToJson(this);
}
