import 'dart:convert';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alibaba_clone/constants/utils/error_handler.dart';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/model/user_model.dart';
import 'package:alibaba_clone/secrets/ip_address.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AuthService {
  final dio = Dio();
  var options = Options(
  headers: {
    'Content-Type': 'application/json; charset=UTF-8',
  },
);

  Future<void> signupUser({
    required BuildContext ctx,
    required WidgetRef ref,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      //Get user model instance
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
        cart: []
      );

      //Connect with auth signup server and add user data to it
      Response response =  await dio.post(
        '$ip/api/signup',
        data: user.toJson(),
        options: options
      );

      //Handle any possible error and show it
      httpErrorHandle(
        ref: ref,
        response: response,
        onSuccess: () {
          flutterToast(
            'Account created! Login with the same credentials!',
          );
        },
      ); 
    } catch (e) {
      flutterToast(e.toString());
    }
  }


  Future<void> signinUser({
    required BuildContext ctx,
    required WidgetRef ref,
    required String email,
    required String password,
  }) async {
    try {
      //Connect with auth signup server and add user data to it
      Response response = await dio.post(
        '$ip/api/signin',
        data: jsonEncode({
          'email': email,
          'password': password
        }),
        options: options
      );

      //If successful, persist user data locally.
      httpErrorHandle(
        response: response,
        ref: ref,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          ref.read(userProvider).setUser(response.data);
           await prefs.setString('x-auth-token', jsonDecode(response.data)['token']);
          // Navigator.pushNamedAndRemoveUntil(
          //   ctx,
          //   BottomBar.routeName,
          //   (route) => false,
          // );
        },
      );
    } catch (e) {
      flutterToast(e.toString());
    }
  }
}