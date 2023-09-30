import 'package:alibaba_clone/constants/widget/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  final void Function()? onPressed;
  const HomeAppBar({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: ReusableTextfield(
              hintText: 'Search goods...',
              hintStyle: TextStyle(fontSize: 14.sp),
              prefixIcon: const Icon(Icons.search),
              filled: true,
              obscureText: false,
              style: TextStyle(fontSize: 14.sp),
              contentPadding: EdgeInsets.symmetric(vertical: 2.h).copyWith(left: 4.w),
              enabledBorder: InputBorder.none,
              maxLines: 1,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Badge.count(
              count: 0,
              child: const Icon(Icons.shopping_cart_outlined)
            )
          )
        ],
      )
    );
  }
}