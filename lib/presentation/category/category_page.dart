import 'package:alibaba_clone/constants/widget/single_product.dart';
import 'package:alibaba_clone/model/product_model.dart';
import 'package:alibaba_clone/presentation/product_details/product_details_page.dart';
import 'package:alibaba_clone/services/home_serices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDealPage extends ConsumerStatefulWidget {
  final String category;
  static const String routeName = '/category_page';
  const CategoryDealPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CategoryDealPageState();
}

class _CategoryDealPageState extends ConsumerState<CategoryDealPage> {
  final HomeServices homeServices = HomeServices();
  List<ProductModel>? productList;


  @override
  void initState() {
    super.initState();
    getCategoryProducts();
  }

  getCategoryProducts() async {
    productList = await homeServices.getCategoryProducts(
      context: context,
      ref: ref, category: widget.category
    );
    setState(() {});
  }

  navigateToProductDetail() {
    Navigator.pushNamed(
      context,
      ProductDetailsPage.routeName,
      arguments: productList
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category),
          centerTitle: true,
        ),
        body: productList == null ? 
        const Center(
          child: CircularProgressIndicator(),
        ) : 
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              alignment: Alignment.topLeft,
              child: Text(
                'Keep shopping for ${widget.category}',
                style: TextStyle(fontSize: 20.sp),
              )
            ),

            SizedBox(
              height: 30.h,
              child: GridView.builder(
                itemCount: productList!.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10.w),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 10,
                ), 
                itemBuilder: ((context, index) {
                  final productData = productList![index];
                  return GestureDetector(
                    onTap: navigateToProductDetail,
                    child: Column(
                      children: [
                        SingleProduct(src: productData.images[0],),
                  
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(top: 5.h, right: 15.w),
                          child: Text(
                            productData.productName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  );
                })
              ),
            )
          ],
        ));
  }
}
