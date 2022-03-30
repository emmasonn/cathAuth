import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  const User(
      {this.email, this.phone, required this.username, required this.password});

  factory User.fromUser(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
