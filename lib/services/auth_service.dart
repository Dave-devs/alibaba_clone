// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:alibaba_clone/constants/utils/error_handler.dart';
import 'package:alibaba_clone/presentation/mobile_screen/mobile_screen.dart';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/model/user_model.dart';
import 'package:alibaba_clone/secrets/ip_address.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> signupUser({
    required BuildContext context,
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
      );

      //Connect with auth signup server and add user data to it
      http.Response response = await http.post(Uri.parse('$ip/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      //Handle any possible error and show it
      httpErrorHandler(
        context: context,
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
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      //Connect with auth signin server and add user data to it
      http.Response response = await http.post(Uri.parse('$ip/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      //If successful, persist user data locally.
      httpErrorHandler(
        response: response,
        context: context,
        onSuccess: () async {
          //Init SharedPreferances
          SharedPreferences prefs = await SharedPreferences.getInstance();

          //Notify all listeners that all user values has been changed(Pls Rebuild)
          Provider.of<UserNotifier>(context, listen: false).setUser(response.body);

          //Store Token to device memory
          await prefs.setString('x-auth-token', jsonDecode(response.body)['token']);

          Navigator.pushNamedAndRemoveUntil(
            context,
            MobileScreen.routeName,
            (route) => false,
          );

        },
      );
    } catch (e) {
      flutterToast(e.toString());
    }
  }


  Future<void> getUserDetails(BuildContext context) async {
    try {
      //Get the token first
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      //If token is null set it (for first time)
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      //Validate token authenticity
      http.Response tokenRes = await http.post(
        Uri.parse('$ip/tokenisvalid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        }
      );

      var response = jsonDecode(tokenRes.body);

      //If token validation is genuine, we get the user data.

      //Request user datas
      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$ip/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        final userProvider = Provider.of<UserNotifier>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      flutterToast(e.toString());
    }
  }
}