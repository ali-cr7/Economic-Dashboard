import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/widgets/custom_serach_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 70),
              fontSize: 40.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        Row(
          spacing: 20.w,
          children: [
            Container(
              height: 40.h,
              width: 240.w,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    const Color(0xFF9A8AEC),
                    const Color(0xB2786CB9),
                    const Color(0xB2685D9F),
                    const Color(0xB2574E86),
                  ],
                ).withOpacity(0.5),
                border: Border.all(color: Color(0xFF927DF7), width: 1),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(child: CustomSearchBar()),
                    ),
                  ),
                ],
              ),
            ),

            Assets.images.profilePhoto.image(height: 66, width: 66),
          ],
        ),
      ],
    );
  }
}
