import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaleEstateContainer extends StatelessWidget {
  const SaleEstateContainer({
    super.key,
    required this.height,
    required this.child,
    this.width,
  });
  final double height;
  final double? width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 578.w,
      height: height.h,
      decoration: ShapeDecoration(
        color: const Color(0x7FE8E8E8),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2.w, color: const Color(0xFF836BFD)),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Center(child: child),
    );
  }
}
