import 'package:alibaba_clone/constants/palette.dart';
import 'package:alibaba_clone/presentation/authentication/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarName extends StatelessWidget {
  const AppBarName({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final user = ref.watch(userChangedNotifierProvider).user;
      return Container(
        width: double.infinity,
        height: 35.h,
        decoration: BoxDecoration(
          color: flexSchemeLight.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              text: 'Hello, ',
              children: [
                TextSpan(text: user.name),
              ],
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    });
  }
}
