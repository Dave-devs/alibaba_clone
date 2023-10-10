// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:alibaba_clone/constants/utils/error_handler.dart';
import 'package:alibaba_clone/constants/utils/snackbar.dart';
import 'package:alibaba_clone/model/product_model.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/secrets/ip_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;

class AdminServices {
  //Handle Sell Product method
  Future<void> sellProducts({
    required BuildContext context,
    required WidgetRef ref,
    required String productName,
    required String description,
    required String category,
    required double quantity,
    required double price,
    required List<File> images,
  }) async {
    //Get user token
    final userProvider = ref.read(userChangedNotifierProvider);

    try {
      //Initilaze Cloudinary
      final cloudinary = CloudinaryPublic('dvjvukieo', 'rgeukdw6');

      List<String> imageUrls = [];
      //Loop through each imageUrl list and map it to cloudinary path
      for (int i = 0; i < imageUrls.length; i++) {
        //Upload all images to cloudinary since we can't do that in MongoDB and get each images in secureUrl
        final CloudinaryResponse res = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(images[0].path, folder: productName));
        imageUrls.add(res.secureUrl);
      }

      //Map admin data to productModel
      ProductModel product = ProductModel(
          images: imageUrls,
          productName: productName,
          description: description,
          category: category,
          price: price,
          quantity: quantity);

      //Connect with Add Product Server Request
      http.Response response = await http.post(Uri.parse('$ip/admin/add-product'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          },
          body: product.toJson());

      httpErrorHandler(
          ref: ref,
          response: response,
          context: context,
          onSuccess: () {
            Navigator.pop(context);
          });
    } catch (e) {
      flutterToast(e.toString());
    }
  }

  //Handle Get Products method
  Future<List<ProductModel>> getAllProducts({
    required WidgetRef ref,
    required BuildContext context
  }) async {
    //Get user token
    final userProvider = ref.read(userChangedNotifierProvider);
    //Empty productList
    List<ProductModel> productList = [ ];

    try {
      //Connect with Get Product Server Request
      http.Response response = await http
          .get(Uri.parse('$ip/admin/get-product'), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token
      });

      httpErrorHandler(
          ref: ref,
          response: response,
          context: context,
          onSuccess: () {
            //Add what we got from the server call to empty productList variable
            for (int i = 0; i < jsonEncode(response.body).length; i++) {
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

  ////Handle Delete Product method
  Future<void> deleteProduct({
    required WidgetRef ref,
    required BuildContext context,
    required ProductModel productModel,
    required void Function() onSuccess,
  }) async {
    final userProvider = ref.read(userChangedNotifierProvider);

    try {
      http.Response response = await http.post(Uri.parse('$ip/admin/delete-product'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          },
          body: jsonEncode({'id': productModel.id}));

      httpErrorHandler(
          ref: ref, response: response, context: context, onSuccess: onSuccess);
    } catch (e) {
      flutterToast(e.toString());
    }
  }
}
