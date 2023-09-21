import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAcctRow extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const HaveAcctRow({super.key, required this.text1, required this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1, style: TextStyle(fontSize: 12.5.sp, fontWeight: FontWeight.w300),),
        GestureDetector(
          onTap: onTap,
          child: Text(text2, style: TextStyle(fontSize: 12.5.sp, fontWeight: FontWeight.w300),)
        )
      ],
    );
  }
}