import 'package:economic_team_desktop/utility/app_colors%20copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeProgressShimmer extends StatelessWidget {
  const HomeProgressShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF574E86),
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 370.w,
        height: 390.h,
        decoration: ShapeDecoration(
          gradient: RadialGradient(
            center: Alignment(0.00, 1.00),
            radius: 1.58,
            colors: [const Color(0x7F9A8AEC), const Color(0xFF574E86)],
          ).withOpacity(0.5),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: const Color(0xFF836BFD)),
            borderRadius: BorderRadius.circular(20.sp),
          ),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    year2023: false,
                    value: 0,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.background,
                    ),
                    strokeWidth: 20,
                  ),
                ),
                // Text(
                //   '$percent%\n$title\n Requests',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 16.sp,
                //     fontFamily: 'Inter',
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
