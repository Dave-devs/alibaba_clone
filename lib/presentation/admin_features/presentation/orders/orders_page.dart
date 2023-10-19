import 'package:alibaba_clone/constants/widget/single_product.dart';
import 'package:alibaba_clone/model/order_model.dart';
import 'package:alibaba_clone/presentation/admin_features/services/admin_services.dart';
import 'package:alibaba_clone/presentation/order_details/orders_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersPage extends ConsumerStatefulWidget {
  static const String routeName = '/order_page';
  const OrdersPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    getAllOrders();
  }

  getAllOrders() async {
    orders = await adminServices.getAllOrders(ref: ref, context: context);
    setState(() { });
  }

  navigateToOrderDetailsPage(index) {
    Navigator.pushNamed(
      context, 
      OrdersDetailsPage.routeName,
      arguments: orders![index]
    );
  }
  @override
  Widget build(BuildContext context) {
    return orders == null ? 
    const Center(child: CircularProgressIndicator(),) : 
    GridView.builder(
      itemCount: orders!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) { 
        final orderData = orders![index];
        return GestureDetector(
          onTap: () => navigateToOrderDetailsPage(index),
          child: SizedBox(
            height: 140,
            child: SingleProduct(src: orderData.products[0].images[0]),
          ),
        );
      },
    );
  }
}
