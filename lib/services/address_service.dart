// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:alibaba_clone/constants/utils/error_handler.dart';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/model/user_model.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/secrets/ip_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class AddressServices{
  //Handle Sell Product method
  Future<void> storeUserAddress({
    required BuildContext context,
    required WidgetRef ref,
    required String address,
  }) async {
    //Get user token
    final userProvider = ref.read(userChangedNotifierProvider);

    try {
      //Connect with Add Product Server Request
      http.Response response = await http.post(
        Uri.parse('$ip/api/store-user-address'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: jsonEncode({
          'address': address,
        })
      );

      httpErrorHandler(
          ref: ref,
          response: response,
          context: context,
          onSuccess: () {
            User user = userProvider.user.copyWith(address: jsonDecode(response.body)['address']);

            userProvider.setUserFromModel(user);
          });
    } catch (e) {
      flutterToast(e.toString());
    }
  }

  //Handle Get Products method
  void placeAnOrder({
    required WidgetRef ref,
    required BuildContext context,
    required double totalSum,
    required String address,
  }) async {
    //Get user token
    final userProvider = ref.read(userChangedNotifierProvider);

    try {
      //Connect with Get Product Server Request
      http.Response response = await http.post(
        Uri.parse('$ip/api/order'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: jsonEncode({
          'cart': userProvider.user.cart,
          'address': address,
          'totalPrice': totalSum,
        })
      );

      httpErrorHandler(
        ref: ref,
        response: response,
        context: context,
        onSuccess: () {
          flutterToast('Your order has been placed!');
          User user = userProvider.user.copyWith(cart: []);
          userProvider.setUserFromModel(user);
        }
      );

    } catch (e) {
      flutterToast(e.toString());
    }
  }
}