import 'dart:convert';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alibaba_clone/constants/utils/error_handler.dart';
import 'package:alibaba_clone/presentation/mobile_screen/mobile_screen.dart';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/model/user_model.dart';
import 'package:alibaba_clone/secrets/ip_address.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {

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
      var response = await http.post(
        Uri.parse('$ip/api/signup'),
        body: user.toJson(),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        }
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
      var response = await http.post(
        Uri.parse('$ip/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password
        }),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        }
      );

      //If successful, persist user data locally.
      httpErrorHandle(
        response: response,
        ref: ref,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          ref.read(userProvider).setUser(response.body);
           await prefs.setString('x-auth-token', jsonDecode(response.body)['token']);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
            ctx,
            MobileScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      flutterToast(e.toString());
    }
  }

  Future<void> getUserDetails(WidgetRef ref) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if(token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$ip/tokenisvalid'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        }
      );

      var response = jsonDecode(tokenRes.body);

      if(response == true) {
        var userRes = await http.post(
        Uri.parse('$ip/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );

        var userProv = ref.read(userProvider);
        userProv.setUser(userRes.body);
      }
   } catch (e) {
      flutterToast(e.toString());
    }
  }
}