import 'dart:convert';

class ProductModel {
  final String? id;
  final List<String> images;
  final String productName;
  final String description;
  final String category;
  final double price;
  final double quantity;

  ProductModel({
    this.id,
    required this.images,
    required this.productName,
    required this.description,
    required this.category,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': images,
      'productName': productName,
      'description': description,
      'category': category,
      'price': price,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      images: List<String>.from((map['image'] as List<String>)),
      productName: map['productName'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
