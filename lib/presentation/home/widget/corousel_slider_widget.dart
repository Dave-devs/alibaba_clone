import 'package:alibaba_clone/constants/core.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderImage extends StatelessWidget {
  const CarouselSliderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: couruselImages.map(
        (e) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              e,
              fit: BoxFit.cover,
              height: 160.h,
              width: MediaQuery.of(context).size.width,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 160,
      ),
    );
  }
}
