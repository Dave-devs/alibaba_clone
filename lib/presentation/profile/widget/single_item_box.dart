import 'package:alibaba_clone/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleItemBox extends StatelessWidget {
  final String image;
  const SingleItemBox({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: flexSchemeLight.tertiaryContainer,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(5),
          color: whyt,
        ),
        child: Container(
          width: 180.w,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            image,
            fit: BoxFit.fitHeight,
            width: 180.w,
          ),
        ),
      ),
    );
  }
}
