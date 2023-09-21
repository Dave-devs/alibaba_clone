import 'package:flutter/material.dart';
import 'package:alibaba_clone/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = ChangeNotifierProvider((ref) => UserNotifier());

class UserNotifier extends ChangeNotifier{
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: []
  );

  dynamic get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}

// final userNotifierProvider = StateNotifierProvider<UserNotifier, User>((ref) {
//   return UserNotifier();
// });

// class UserNotifier extends StateNotifier<User> {
//   UserNotifier() : super(User(
//     id: '',
//     name: '',
//     email: '',
//     password: '',
//     address: '',
//     type: '',
//     token: '',
//     cart: [],
//   ));

//   void setUser(String user) {
//     state = User.fromJson(user);
//   }

//   void setUserFromModel(User user) {
//     state = user;
//   }
// }