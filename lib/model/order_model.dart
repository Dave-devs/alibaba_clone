// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:alibaba_clone/model/product_model.dart';

class Order {
  final String id;
  final List<Product> products;
  final List<int> quantity;
  final String address;
  final String userId;
  final int orderAt;
  final int status;
  final double orderTotal;

  Order({
    required this.id,
    required this.products,
    required this.quantity,
    required this.address,
    required this.userId,
    required this.orderAt,
    required this.status,
    required this.orderTotal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'quantity': quantity,
      'address': address,
      'userId': userId,
      'orderAt': orderAt,
      'status': status,
      'orderTotal': orderTotal,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] as String,
      products: List<Product>.from(map['products'] ?.map((x) => Product.fromMap(x['product']))),
      quantity: List<int>.from(map['products'] ?.map((x) => x['quantity'])),
      address: map['address'] as String,
      userId: map['userId'] as String,
      orderAt: map['orderAt'] as int,
      status: map['status'] as int, 
      orderTotal: map['orderTotal'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
