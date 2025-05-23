

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpertMessage extends StatelessWidget {
  const ExpertMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.all(12.sp),
      constraints: BoxConstraints(maxWidth: 267.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x4C000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        color: Color(0xAD9A8AEC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19.sp),
          topRight: Radius.circular(19.sp),
          bottomRight: Radius.circular(19.sp),
        ),
      ),
      child: Text(
        "Hello, I'm Ali from Expert Team. How can I help you",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.sp,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}