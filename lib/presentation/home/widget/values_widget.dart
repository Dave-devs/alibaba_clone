import 'package:alibaba_clone/constants/core.dart';
import 'package:alibaba_clone/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValuesWidget extends StatelessWidget {
  const ValuesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: flexSchemeDark.tertiaryContainer
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: valuesImages.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: flexSchemeLight.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    valuesImages[index]['image']!,
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(width: 10.w,),
                Text(
                  valuesImages[index]['name']!,
                  style: TextStyle(
                    color: whyt,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}