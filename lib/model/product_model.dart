// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alibaba_clone/model/rating_model.dart';

class ProductModel {
  final String? id;
  final List<String> images;
  final String productName;
  final String description;
  final String category;
  final double price;
  final double quantity;
  final List<RatingModel>? rating;

  ProductModel({
    this.id,
    required this.images,
    required this.productName,
    required this.description,
    required this.category,
    required this.price,
    required this.quantity,
    this.rating,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': images,
      'productName': productName,
      'description': description,
      'category': category,
      'price': price,
      'quantity': quantity,
      'rating': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['_id'] != null ? map['id'] as String : null,
      images: List<String>.from((map['images'] as List<String>)),
      productName: map['productName'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as double,
      rating: map['ratings'] != null ? List<RatingModel>.from((map['rating'] as List<int>).map<RatingModel?>((x) => RatingModel.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
