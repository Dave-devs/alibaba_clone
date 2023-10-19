import 'package:alibaba_clone/presentation/home/widget/deal_of_the_day.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:alibaba_clone/presentation/home/widget/address_widget.dart';
import 'package:alibaba_clone/presentation/home/widget/appbar_widget.dart';
import 'package:alibaba_clone/presentation/home/widget/corousel_slider_widget.dart';
import 'package:alibaba_clone/presentation/home/widget/product_pics_widget.dart';
import 'package:alibaba_clone/presentation/home/widget/values_widget.dart';
import 'package:alibaba_clone/presentation/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  static const String routeName = '/home_page';
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  navigateToSearchPage(String query) {
    Navigator.pushNamed(
      context,
      SearchPage(searchQuery: query) as String,
      arguments: query
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userChangedNotifierProvider).user;

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
            AddressWidget(
              text: 'Delevery to ${user.name} ${user.address}',
            ),

            const ValuesWidget(),

            const CarouselSliderImage(),

            SizedBox(height: 10.h),

            const DealOfTheDay(
              '',
            ),

            SizedBox(height: 10.h),

            const ProductPicsWidget(),
            
            Container(
              padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
              child: const Text('Show all items'),
            )
          ],
        ));
  }
}
