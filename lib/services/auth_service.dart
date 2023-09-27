// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/presentation/dimension/layout_buider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alibaba_clone/constants/utils/error_handler.dart';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/model/user_model.dart';
import 'package:alibaba_clone/secrets/ip_address.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future signupUser({
    required WidgetRef ref,
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
      http.Response response = await http.post(
        Uri.parse('$ip/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );

      //Handle any possible error and show it
      httpErrorHandler(
        ref: ref,
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

  Future signinUser({
    required WidgetRef ref,
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      //Connect with auth signin server and add user data to it
      http.Response response = await http.post(Uri.parse('$ip/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      //If successful, persist user data locally.
      httpErrorHandler(
        ref: ref,
        response: response,
        context: context,
        onSuccess: () async {
          //Notify all listeners that all user values has been changed(Pls Rebuild)
          // Provider.of<UserNotifier>(context, listen: false).setUser(response.body);
          ref.read(userChangedNotifierProvider).setUser(response.body);

          //Init SharedPreferances and Store Token to app memory
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(
              'x-auth-token', jsonDecode(response.body)['token']);

          Navigator.pushNamedAndRemoveUntil(
            context,
            ScreenLayoutDimension.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      flutterToast(e.toString());
    }
  }

  Future getUserDetails(BuildContext context, WidgetRef ref) async {
    try {
      //Get the token first
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      //If token is null set it (for first time user)
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      //Validate token authenticity
      http.Response tokenRes = await http.post(Uri.parse('$ip/tokenisvalid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });

      //This response will be in boolean as set in server
      var response = jsonDecode(tokenRes.body);

      //NOTE: If token validation is genuine(true), we get the user data.

      //Request user details
      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$ip/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        ref.read(userChangedNotifierProvider).setUser(userRes.body);
        // userProvider.setUser(userRes.body);
      }
    } catch (e) {
      flutterToast(e.toString());
    }
  }
}
