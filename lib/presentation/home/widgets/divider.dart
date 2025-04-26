import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200.13.w,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.h,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFF826AFC),
          ),
        ),
      ),
    );
  }
}