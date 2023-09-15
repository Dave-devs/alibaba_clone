import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRowText extends StatelessWidget {
  final String text1;
  final String text2;
  const TopRowText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        Text(
          text2,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w100),
        )
      ],
    );
  }
}