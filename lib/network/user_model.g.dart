// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
    };
