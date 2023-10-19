import 'package:alibaba_clone/constants/palette.dart';
import 'package:alibaba_clone/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/product_model.dart';
import '../../product_details/product_details_page.dart';

class DealOfTheDay extends ConsumerStatefulWidget {
  final String picPath;
  // final String priceTag;
  // final String decs;
  const DealOfTheDay(this.picPath, {Key? key}) : super(key: key);

  @override
  ConsumerState<DealOfTheDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends ConsumerState<DealOfTheDay> {
  final HomeServices homeServices = HomeServices();
  Product? products;

  @override
  void initState() {
    super.initState();
    getDealOfTheDay();
  }

  getDealOfTheDay() async {
    products = await homeServices.getDealOfTheDay(context: context, ref: ref);
    setState(() {});
  }

  navigateToDetailsPage() {
    Navigator.pushNamed(context, ProductDetailsPage.routeName,
        arguments: products);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : products!.productName.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailsPage,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: Text(
                        'Deal of the day',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ),
                    Image.network(
                      products!.images[0],
                      height: 235.h,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '\$${products!.price}',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: Text(
                        products!.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: products!.images
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.fitWidth,
                                width: 100,
                                height: 100,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'See all deals',
                        style: TextStyle(
                          color: flexSchemeDark.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
