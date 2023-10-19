// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:alibaba_clone/constants/utils/error_handler.dart';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/model/product_model.dart';
import 'package:alibaba_clone/model/user_model.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/secrets/ip_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ProductDetailServices {
  void rateProduct({
    required BuildContext context,
    required WidgetRef ref,
    required Product product,
    required double rating,
  }) async {
    final userProvider = ref.read(userChangedNotifierProvider);

    try {
      http.Response response =
          await http.post(Uri.parse('$ip/api/rate-product'),
              body: jsonEncode({
                'id': product.id!,
                'rating': rating,
              }),
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          });

      httpErrorHandler(
          ref: ref, response: response, context: context, onSuccess: () {});
    } catch (e) {
      flutterToast(e.toString());
    }
  }

  void addProductToCart({
    required BuildContext context,
    required WidgetRef ref,
    required Product product,
    // required double rating,
  }) async {
    final userProvider = ref.read(userChangedNotifierProvider);

    try {
      http.Response response = await http.post(Uri.parse('$ip/api/add-to-cart'),
          body: jsonEncode({
            'id': product.id!,
            // 'rating': rating,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          });

      httpErrorHandler(
          ref: ref,
          response: response,
          context: context,
          onSuccess: () {
            User user = userProvider.user
                .copyWith(cart: jsonDecode(response.body)['cart']);
            userProvider.setUserFromModel(user);
          });
    } catch (e) {
      flutterToast(e.toString());
    }
  }
}
