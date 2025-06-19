import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CurrencyItemShimmer extends StatelessWidget {
  const CurrencyItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFF836BFD),
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: 220.w,
          height: 50.h,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.15),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: const Color(0xFF836BFD)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
