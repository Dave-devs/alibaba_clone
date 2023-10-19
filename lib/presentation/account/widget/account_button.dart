import 'package:alibaba_clone/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const AccountButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        height: 40.h,
        decoration: BoxDecoration(
          border: Border.all(color: whyt, width: 0),
          borderRadius: BorderRadius.circular(50),
          color: whyt,
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            // primary: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
