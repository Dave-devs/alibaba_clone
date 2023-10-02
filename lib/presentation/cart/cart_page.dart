import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static const String routeName = '/cart_page';
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
    );
  }
}