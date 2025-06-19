import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMessage extends StatelessWidget {
  final String text;
  
  const UserMessage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.all(12.sp),
      constraints: BoxConstraints(maxWidth: 266.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x265B5B5B),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        color: Color(0x265B5B5B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19.sp),
          topRight: Radius.circular(19.sp),
          bottomLeft: Radius.circular(19.sp),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 13.sp,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}

