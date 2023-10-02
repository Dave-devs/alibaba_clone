import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  static const String routeName = '/cart_page';
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Page'),
      ),
      body: Container(),
    );
  }
}
