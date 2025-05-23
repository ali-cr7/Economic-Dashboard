import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/profile/widgets/profile_row_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: HomeHeader(title: 'Profile'),
        ),

        SizedBox(height: 20.h),
        CustomDivider(),
        Padding(
          padding: EdgeInsets.all(14.0.sp),
          child: Container(
            width: 550.w,
            height: 440.h,
            decoration: ShapeDecoration(
              color: const Color(0x7FE8E8E8),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2.sp, color: const Color(0xFF836BFD)),
                borderRadius: BorderRadius.circular(20.sp),
              ),
            ),
            child: Column(
              children: [
                Row(
                  spacing: 15.w,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180.44.r,
                        height: 180.44.r,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(
                            side: BorderSide(
                              width: 4.w,
                              color: const Color(0xFF836BFD),
                            ),
                          ),
                        ),
                        child: Assets.images.profilePhoto.image(
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          name!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          formatJoinedDate(joinDate!),
                          style: TextStyle(
                            color: Colors.black.withValues(alpha: 135),
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                  child: Column(
                    children: [
                      ProfileInfoRow(
                        icon: Assets.images.message.image(),
                        onTap: () {},
                        text: email!,
                      ),
                      ProfileInfoRow(
                        icon: Assets.images.phone.image(),
                        onTap: () {},
                        text: phone!,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                  child: Row(
                    children: [
                      Text(
                        'logged in ',
                        style: TextStyle(
                          color: const Color(0x990E9039),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '9:20 am 1-2-2025',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 153),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'logged out ',
                        style: TextStyle(
                          color: const Color(0x99C21932),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '4:30 pm 1-2-2025',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 153),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String formatJoinedDate(String isoDate) {
  try {
    // Parse the ISO date string into a DateTime object
    DateTime date = DateTime.parse(isoDate);

    // Format the date as "d MMMM yyyy" (e.g., "14 April 2025")
    String formattedDate = DateFormat('d MMMM yyyy').format(date);

    return 'joined in $formattedDate';
  } catch (e) {
    // Fallback if parsing fails
    return 'joined in Unknown date';
  }
}
