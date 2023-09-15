import 'package:alibaba_clone/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AltItem extends StatelessWidget {
  final String item;
  final void Function()? onTap;
  const AltItem({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: onBg,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Image.asset(item, scale: 35,),
      ),
    );
  }
}