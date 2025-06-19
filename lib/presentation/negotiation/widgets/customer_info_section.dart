import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerInfoSection extends StatelessWidget {
  const CustomerInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: 530.w,
        height: 868.h,
        decoration: ShapeDecoration(
          color: const Color(0x3D9A8AEC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.44.r,
              height: 200.44.r,
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
          ],
        ),
      ),
    );
  }
}