import 'package:catholic/managers/user_repository.dart';
import 'package:catholic/network/post_model.dart';
import 'package:flutter/material.dart';

import '../network/user_model.dart';

class UserManager extends ChangeNotifier {
  UserManager(this.repository);
  UserRepository repository;
  late One? loggedUser;
  bool? _isRegistered;
  bool? get isUserRegistered => _isRegistered;

  Future<bool> checkIfUserExist(String email) async {
    final user = await repository.checkUser(email);
    if (user.isLogged) {
      return true;
    } else {
      return false;
    }
  }

  Future<One> signUpUser(User user) async {
    final result = await repository.register(user);
    loggedUser = result.data.one;
    return Future.value(loggedUser);
  }

  Future<One> loginUser(User user) async {
    final result = await repository.login(user);
    loggedUser = result.data.one;
    return Future.value(loggedUser);
  }
}
