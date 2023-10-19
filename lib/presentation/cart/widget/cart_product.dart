import 'package:alibaba_clone/model/product_model.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/services/product_detail_service.dart';
import 'package:alibaba_clone/services/cart_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/palette.dart';

class CartProduct extends ConsumerStatefulWidget {
  final int index;
  const CartProduct({Key? key, required this.index}) : super(key: key);

  @override
  ConsumerState<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends ConsumerState<CartProduct> {
  final ProductDetailServices productDetailServices = ProductDetailServices();
  final CartServices cartServices = CartServices();

  increaseProductQuantity(Product product) {
    productDetailServices.addProductToCart(
        context: context, ref: ref, product: product);
  }

  decreaseProductQuantity(Product product) {
    cartServices.removeFromCart(context: context, ref: ref, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final productCart =
        ref.watch(userChangedNotifierProvider).user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 135.h,
                width: 135.w,
              ),
              Column(
                children: [
                  Container(
                    width: 235.w,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      product.productName,
                      maxLines: 2,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                  Container(
                    width: 235.w,
                    padding: EdgeInsets.only(left: 10.w, top: 5.h),
                    child: Text(
                      '\$${product.price}',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 235.w,
                    padding: EdgeInsets.only(left: 10.w),
                    child: const Text(
                      'Eligible for FREE Shipping',
                    ),
                  ),
                  Container(
                    width: 235.w,
                    padding: EdgeInsets.only(left: 10.w, top: 5.h),
                    child: Text(
                      'In Stock',
                      style: TextStyle(
                        color: flexSchemeLight.primary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.5),
                    color: Colors.black12),
                child: Row(
                  children: [
                    //Remove item
                    GestureDetector(
                      onTap: () => decreaseProductQuantity,
                      child: Container(
                        width: 35,
                        height: 32,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.remove,
                          size: 18,
                        ),
                      ),
                    ),

                    //Item quantity
                    DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1.5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0)),
                      child: Container(
                        width: 35,
                        height: 32,
                        alignment: Alignment.center,
                        child: Text(quantity.toString()),
                      ),
                    ),

                    //Add item
                    GestureDetector(
                      onTap: () => increaseProductQuantity(product),
                      child: Container(
                        width: 35,
                        height: 32,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.add,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
