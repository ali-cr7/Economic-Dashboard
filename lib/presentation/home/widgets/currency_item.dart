import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({
    super.key,
    required this.currencyName,
    required this.currencyValue,
  });

  final String currencyName;
  final String currencyValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      height: 50.h,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.15),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: const Color(0xFF836BFD)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 6),
            Text(
              '$currencyName: ',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              currencyValue,
              style: TextStyle(
                color: const Color(0xFF27B055),
                fontSize: 16.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
