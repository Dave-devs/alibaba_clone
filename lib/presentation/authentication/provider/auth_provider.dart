import 'package:alibaba_clone/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// final userChangeNotifierProvider = ChangeNotifierProvider((ref) => UserNotifier());

class UserNotifier extends ChangeNotifier{
  User _user = const User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}