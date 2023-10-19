import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSubtotal extends ConsumerStatefulWidget {
  const CartSubtotal({ Key? key }) : super(key: key);

  @override
  ConsumerState createState() => _CartSubtotalState();
}

class _CartSubtotalState extends ConsumerState<CartSubtotal> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userChangedNotifierProvider).user;
    int sum = 0;
    //To calculate product sum price, we calculate product quantity * product price
    user.cart.map((e) => sum += e['quantity'] * e['product']['price'] as int).toList();
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text('Subtotal ', style: TextStyle(fontSize: 20.sp),),

          Text('\$$sum', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}