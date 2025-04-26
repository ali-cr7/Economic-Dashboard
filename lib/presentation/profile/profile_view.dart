import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/profile/widgets/profile_row_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HomeHeader(title: 'Profile'),
        ),

        SizedBox(height: 20.h),
        CustomDivider(),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            width: 550.w,
            height: 440.h,
            decoration: ShapeDecoration(
              color: const Color(0x7FE8E8E8),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: const Color(0xFF836BFD)),
                borderRadius: BorderRadius.circular(20),
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
                        width: 150.44,
                        height: 150.44,
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
                          'Ali Mossa',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'joined in 2 April 2020',
                          style: TextStyle(
                            color: Colors.black.withValues(alpha: 135),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    ProfileInfoRow(
                      icon: Assets.images.message.image(),
                      onTap: () {},
                      text: 'email.email@gmail.com',
                    ),
                    ProfileInfoRow(
                      icon: Assets.images.phone.image(),
                      onTap: () {},
                      text: '+963 9933445588',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'logged in ',
                      style: TextStyle(
                        color: const Color(0x990E9039),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '9:20 am 1-2-2025',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 153),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'logged out ',
                      style: TextStyle(
                        color: const Color(0x99C21932),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '4:30 pm 1-2-2025',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 153),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
