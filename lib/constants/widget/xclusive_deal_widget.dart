// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:alibaba_clone/constants/core.dart';

class XclusiveDeal extends StatelessWidget {
  final String picPath;
  final String priceTag;
  final String decs;
  const XclusiveDeal({
    Key? key,
    required this.picPath,
    required this.priceTag,
    required this.decs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(pic,),
                fit: BoxFit.fitHeight
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 5.h),
            child: Text(
              priceTag,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(top: 2.h),
            child: Text(
              decs,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }
}
