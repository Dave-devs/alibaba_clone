import 'package:alibaba_clone/constants/palette.dart';
import 'package:alibaba_clone/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alibaba_clone/constants/widget/ratings.dart';

class SearchedProducts extends ConsumerWidget {
  final Product product;
  const SearchedProducts({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double totalRating = 0;
    //Check product rating count
    for (int i = 0; i < product.rating!.length; i++) {
      //Assign product rating count to totalRating
      totalRating += product.rating![i].rating;
    }

    //We check if total rating is not 0
    double avgRating = 0;
    if (totalRating != 0) {
      //Then we assign result of total rating divided from product rating (sum of all rating)
      avgRating = totalRating / product.rating!.length;
    }

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
                    child: Ratings(ratings: avgRating),
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
      ],
    );
  }
}
