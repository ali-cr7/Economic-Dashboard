import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 50.h,
      decoration: ShapeDecoration(
        color: Colors.white.withValues(alpha: 40),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: const Color(0xFF836BFD),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Syrian Pound: ',
            style: TextStyle(
              color: Colors.black.withValues(alpha: 10),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '12943.47',
            style: TextStyle(
              color: const Color(0xFF27B055),
              fontSize: 16.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}