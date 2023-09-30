import 'package:alibaba_clone/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressWidget extends StatelessWidget {
  final String text;
  const AddressWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: flexSchemeLight.primary
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 20),
                SizedBox(width: 6.w,),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  )
                ),
                const Icon(Icons.abc, size: 20,)

              ],
            ),
          );
  }
}