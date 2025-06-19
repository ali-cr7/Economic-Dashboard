import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class UserListItemShimmer extends StatelessWidget {
  const UserListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800.w,
      height: 95.h,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 1.00),
          end: Alignment(1.00, 0.12),
          colors: [
            const Color(0xFFD5CFF5),
            const Color(0xB2A9A4C2),
            const Color(0xB2928EA8),
            const Color(0xB27C798F),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2.w, color: const Color(0xFF836BFD)),
          borderRadius: BorderRadius.circular(20.sp),
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 16.w),
              // Avatar Shimmer
              CircleAvatar(
                radius: 35.r,
                backgroundColor: Colors.white,
              ),

              SizedBox(width: 16.w),

              // User Info and Last Message Shimmer
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Username Shimmer
                    Container(
                      width: 120.w,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    // Last Message Shimmer
                    Container(
                      width: 200.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // Time Shimmer
                    Container(
                      width: 60.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
              ),

              // Chat Button Shimmer
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 