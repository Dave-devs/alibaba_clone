// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:alibaba_clone/constants/utils/error_handler.dart';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/presentation/admin_features/model/product_model.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/secrets/ip_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class SearchServices{
  Future<List<ProductModel>> getSearchedProducts({
    required BuildContext context,
    required WidgetRef ref,
    required String query,
  }) async {
    final userProvider = ref.read(userChangedNotifierProvider);
    //Empty productList
    List<ProductModel> productList = [];

    try {
      //Connect with Get Product Server Request
      http.Response response = await http.get(
          Uri.parse('$ip/api/products/search/$query'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          });

      httpErrorHandler(
          ref: ref,
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              productList.add(ProductModel.fromJson(
                  jsonEncode(jsonDecode(response.body)[i])));
            }
          });
    } catch (e) {
      flutterToast(e.toString());
    }
    //Return the gotten data
    return productList;
  }
}