import 'package:alibaba_clone/constants/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPicsWidget extends StatelessWidget {
const ProductPicsWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w).copyWith(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all()
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.network(pic, fit: BoxFit.fitWidth, width: 80.w,)),
          SizedBox(width: 2.w,),
          ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.network(pic, fit: BoxFit.fitWidth, width: 80.w,)),
          SizedBox(width: 2.w,),
          ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.network(pic, fit: BoxFit.fitWidth, width: 80.w,)),
          SizedBox(width: 2.w,),
          ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.network(pic, fit: BoxFit.fitWidth, width: 80.w,)),
        ]
      ),
    );
  }
}