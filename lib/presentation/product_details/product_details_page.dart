import 'package:alibaba_clone/constants/palette.dart';
import 'package:alibaba_clone/constants/widget/ratings.dart';
import 'package:alibaba_clone/constants/widget/reusable_button.dart';
import 'package:alibaba_clone/model/product_model.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/presentation/home/widget/appbar_widget.dart';
import 'package:alibaba_clone/presentation/search/search_page.dart';
import 'package:alibaba_clone/services/product_detail_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  static const String routeName = '/product_details_page';
  final Product product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  ConsumerState<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
  final ProductDetailServices productDetailServices = ProductDetailServices();
  double avgRating = 0;
  double userRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    //Check product rating count
    for (int i = 0; i < widget.product.rating!.length; i++) {
      //Assign product rating count to totalRating
      totalRating += widget.product.rating![i].rating;
      //Check if userId of the rating match with userId...
      if (widget.product.rating![i].userId ==
          ref.read(userChangedNotifierProvider).user.id) {
        //We assign the rating to the user
        userRating = widget.product.rating![i].rating;
      }
    }

    //We check if total rating is not 0
    if (totalRating != 0) {
      //Then we assign result of total rating divided from product rating (sum of all rating)
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  navigateToSearchPage(String query) {
    Navigator.pushNamed(context, SearchPage(searchQuery: query) as String,
        arguments: query);
  }

  addProductToCart() {
    productDetailServices.addProductToCart(
        context: context, ref: ref, product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: HomeAppBar(
            onFieldSubmitted: navigateToSearchPage,
            onPressed: () {
              //This is for Icon click
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  Ratings(ratings: avgRating)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.product.productName,
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            CarouselSlider(
                items: widget.product.images.map((i) {
                  return Builder(
                      builder: ((context) => Image.network(
                            i,
                            fit: BoxFit.contain,
                            height: 200,
                          )));
                }).toList(),
                options: CarouselOptions(viewportFraction: 1, height: 300)),
            Container(
              height: 5,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      text: 'Deal Price: ',
                      style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: '\$${widget.product.price}',
                        style: TextStyle(
                            fontSize: 22.0,
                            color: flexSchemeLight.primary,
                            fontWeight: FontWeight.w500)),
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              height: 5,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReusableButton(
                text: 'Buy Now',
                minimumSize: const Size(375, 40),
                backgroundColor: flexSchemeLight.primary,
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReusableButton(
                text: 'Add to Cart',
                minimumSize: const Size(375, 40),
                backgroundColor: flexSchemeDark.primary,
                onPressed: addProductToCart,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 5,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Rate the Product',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ),
            RatingBar.builder(
              initialRating: userRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (rating) {
                productDetailServices.rateProduct(
                    context: context,
                    ref: ref,
                    product: widget.product,
                    rating: rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}
