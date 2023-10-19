import 'package:alibaba_clone/constants/widget/reusable_button.dart';
import 'package:alibaba_clone/presentation/address/address_page.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/presentation/cart/widget/cart_product.dart';
import 'package:alibaba_clone/presentation/cart/widget/cart_subtotal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home/widget/address_widget.dart';
import '../home/widget/appbar_widget.dart';
import '../search/search_page.dart';

class CartPage extends ConsumerStatefulWidget {
  static const String routeName = '/cart_page';
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  navigateToSearchPage(String query) {
    Navigator.pushNamed(
      context,
      SearchPage(searchQuery: query) as String,
      arguments: query
    );
  }

  navigateToAddressPage(int sum) {
    Navigator.pushNamed(
      context,
      AddressPage.routeName,
      arguments: sum.toString()
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userChangedNotifierProvider).user;

    int sum = 0;
    //To calculate product sum price, we calculate product quantity * product price
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: HomeAppBar(
          onFieldSubmitted: navigateToSearchPage,
          onPressed: () { 
            //This is for Icon click
          },
        )
      ),

      body: ListView(
        children: [
          const AddressWidget(text: 'Delevery to John Doe',),

          const CartSubtotal(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReusableButton(
              text: 'Proceed to Buy (${user.cart.length})',
              onPressed: () => navigateToAddressPage(sum),
              minimumSize: const Size(275, 40),
            ),
          ),

          const SizedBox(height: 15,),

          Container(
            height: 1,
            color: Colors.black12.withOpacity(0.08),
          ),

          const SizedBox(height: 5,),

          ListView.builder(
            shrinkWrap: true,
            itemCount: user.cart.length,
            itemBuilder: ((context, index) {
              return CartProduct(
                index: index,
              );
            }) 
          )
        ],
      )
    );
  }
}