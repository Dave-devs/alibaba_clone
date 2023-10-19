// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:alibaba_clone/constants/utils/error_handler.dart';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/model/order_model.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/presentation/authentication/screens/register_page.dart';
import 'package:alibaba_clone/secrets/ip_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountServices {
  Future<List<Order>> getUserOrders({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final userProvider = ref.read(userChangedNotifierProvider);
    //Empty productList
    List<Order> orderList = [];

    try {
      //Connect with GetProduct Server Request
      http.Response response = await http.get(
        Uri.parse('$ip/api/orders/user_order'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        }
      );

      httpErrorHandler(
        ref: ref,
        response: response,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(response.body).length; i++) {
            orderList.add(Order.fromJson(jsonEncode(jsonDecode(response.body)[i])));
          }
        }
      );
    } catch (e) {
      flutterToast(e.toString());
    }
    //Return the gotten data
    return orderList;
  }

  void logOut({
    required BuildContext context,
    required WidgetRef ref
  }) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');

      Navigator.pushNamedAndRemoveUntil(
        context,
        RegisterPage.routeName,
        (route) => false
      );
    } catch (e) {
      flutterToast(e.toString());
    }
  }
}