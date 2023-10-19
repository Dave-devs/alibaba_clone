import 'package:alibaba_clone/model/product_model.dart';
import 'package:alibaba_clone/presentation/home/widget/address_widget.dart';
import 'package:alibaba_clone/presentation/home/widget/appbar_widget.dart';
import 'package:alibaba_clone/presentation/product_details/product_details_page.dart';
import 'package:alibaba_clone/presentation/search/widgets/searched_products.dart';
import 'package:alibaba_clone/services/search_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends ConsumerStatefulWidget {
  final String searchQuery;
  static const String routeName = '/search_page';
  const SearchPage({Key? key, required this.searchQuery}) : super(key: key);

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final SearchServices searchServices = SearchServices();
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    getSearchedProducts();
  }

  getSearchedProducts() async {
    products = await searchServices.getSearchedProducts(
        context: context, ref: ref, query: widget.searchQuery);
    setState(() {});
  }

  void navigateToSearchPage(String query) {
    Navigator.pushNamed(context, SearchPage(searchQuery: query) as String,
        arguments: query);
  }

  // void navigateToProductDetail(index) {
  //   Navigator.pushNamed(
  //     context,
  //     ProductDetailsPage.routeName,
  //     arguments: products![index]
  //   );
  // }

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
      body: products == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const AddressWidget(text: 'Address here'),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          final productData = products![index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductDetailsPage.routeName,
                                    arguments: products![index]);
                              },
                              child: SearchedProducts(
                                product: productData,
                              ));
                        })),
              ],
            ),
    );
  }
}
