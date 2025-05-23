import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpertMessageWithButtons extends StatelessWidget {
  const ExpertMessageWithButtons({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Our expert team reached an offer about your home that requires that half of the amount be paid over three months and after the end of the remaining half investment in addition to 5% of the investments",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Accept Button
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: Color(
                    0x5946E050,
                  ).withOpacity(0.35),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Accept',
                  style: TextStyle(
                    color: Color(0xFF036D0F),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              // Reject Button
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: Color(
                    0x3FD9D9D9,
                  ).withOpacity(0.25),
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Text(
                  'reject',
                  style: TextStyle(
                    color: Color(0xBFF1272A),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}