import 'dart:convert';

import 'package:catholic/network/catholic_service.dart';
import 'package:catholic/network/post_model.dart';
import 'package:catholic/network/response_model.dart';
import 'package:flutter/material.dart';
import '../network/user_model.dart';
import '../util/data_result.dart';

class UserRepository {
  UserRepository(this.service);
  CatholicService service;

  Future<dynamic> checkUser(String email) async {
    final userJson = await service.checkUser(email);
    print('data: $userJson');
    final userMap = json.decode(userJson);
    if (userMap['status'] == "OK") {
      final model = PostModel.fromJson(userMap['response']);
      return model;
    }
    final model = ResponseModel.fromJson(userMap['response']);
    return model;
  }

  Future<PostModel> register(User user) async {
    final userJson = await service.registerUser(user);
    final userMap = json.decode(userJson);
    print('user: $userMap');
    final model = PostModel.fromJson(userMap['response']);
    return model;
  }

  Future<PostModel> login(User user) async {
    final userJson = await service.logInUser(user);
    final userMap = json.decode(userJson);
    print('userRegister: $userMap');

    final model = PostModel.fromJson(userMap['response']);
    return model;
  }
}
