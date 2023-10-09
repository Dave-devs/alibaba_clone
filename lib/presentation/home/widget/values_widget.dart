import 'package:alibaba_clone/constants/core.dart';
import 'package:alibaba_clone/constants/palette.dart';
import 'package:alibaba_clone/presentation/category/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValuesWidget extends StatelessWidget {
  const ValuesWidget({super.key});

  navagateToCategoryPage(BuildContext ctx, String category) {
    Navigator.pushNamed(ctx, CategoryDealPage(category: category) as String,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: flexSchemeDark.tertiaryContainer),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navagateToCategoryPage(
                  context, categoryImages[index]['name']!),
              child: Container(
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
                        categoryImages[index]['image']!,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      categoryImages[index]['name']!,
                      style: TextStyle(
                          color: whyt,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
