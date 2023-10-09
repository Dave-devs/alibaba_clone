import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleProduct extends StatelessWidget {
final String src;
const SingleProduct({ Key? key, required this.src }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Container(
          height: 180.h,
          padding: EdgeInsets.all(15.w),
          child: Image.network(
            src,
            fit: BoxFit.fitHeight,
            width: 180.w
          )
        )
      )
    );
  }
}