import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ChartShimmer extends StatelessWidget {
  const ChartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFF574E86),
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: 800.44.w,
          height: 550.83.h,
          decoration: ShapeDecoration(
            gradient: RadialGradient(
              center: Alignment(0.00, 1.00),
              radius: 1.58,
              colors: [const Color(0x7F9A8AEC), const Color(0xFF574E86)],
            ).withOpacity(0.5),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: const Color(0xFF826AFC)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
