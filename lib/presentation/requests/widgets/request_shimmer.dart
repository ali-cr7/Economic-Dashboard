import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RequestsShimmerItem extends StatelessWidget {
  const RequestsShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
               width: 1150.w,
      height: 95.h, 
         decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 1.00),
          end: Alignment(1.00, -0.00),
          colors: [
            const Color(0xFFD5CFF5),
            const Color(0xB2A9A4C2),
            const Color(0xB2928EA8),
            const Color(0xB27C798F),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: const Color(0xFF836BFD)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
        ),
      ),
    );
  }
}
