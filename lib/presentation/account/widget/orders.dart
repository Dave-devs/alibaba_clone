import 'package:alibaba_clone/constants/palette.dart';
import 'package:alibaba_clone/model/order_model.dart';
import 'package:alibaba_clone/presentation/account/widget/single_item_box.dart';
import 'package:alibaba_clone/presentation/order_details/orders_details_page.dart';
import 'package:alibaba_clone/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Orders extends ConsumerStatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  ConsumerState<Orders> createState() => _OrdersState();
}

class _OrdersState extends ConsumerState<Orders> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchUserOrders();
  }

  void fetchUserOrders() async {
    orders = await accountServices.getUserOrders(context: context, ref: ref);
    setState(() { });
  }

  void navigateToOrderDetailsPage(int index) {
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
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15,),
              child: Text(
                'See all',
                style: TextStyle(color: flexSchemeLight.secondary,),
              ),
            ),
          ],
        ),

        // display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10,top: 20,right: 0,),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: orders!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => navigateToOrderDetailsPage(index),
                child: SingleItemBox(
                  image: orders![index].products[0].images[0],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
