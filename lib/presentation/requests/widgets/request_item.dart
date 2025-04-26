import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/utility/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RequestsItem extends StatelessWidget {
  const RequestsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 12.0, right: 12.0),
        child: Row(
          children: [
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Al Malkeh  - Al Affef Street - 113 Building - 4th Floor',
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 10),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Row(
                    spacing: 10.w,

                    children: [
                      Container(
                        width: 160.w,
                        height: 34.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF27B055),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: const Color(0xFF27B055).withOpacity(0.47),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Assets.images.balance.image(width: 20, height: 20),
                            Text(
                              'Legally Accepted',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            //SizedBox(width: ,),
                            Text(
                              '12-2-2025 ',
                              style: TextStyle(
                                color: const Color(0xFF1E1E1E),
                                fontSize: 10.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 120.w,
                        height: 34.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xAFFB647B),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: const Color(0xFFEC2846),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Assets.images.up_down.image(width: 20, height: 20),
                            Text(
                              're-study ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '12-2-2025 ',
                              style: TextStyle(
                                color: const Color(0xFF1E1E1E),
                                fontSize: 10.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 180.w,
                        height: 34.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE6FF56).withOpacity(0.67),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: const Color(0x77E5FF55),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Assets.images.discussingCriticize.image(
                              width: 20,
                              height: 20,
                            ),
                            Text(
                              'negotiation Accepted',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '12-2-2025 ',
                              style: TextStyle(
                                color: const Color(0xFF1E1E1E),
                                fontSize: 10.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kRequestDetailsView);
              },
              child: Container(
                width: 79.w,
                height: 33.h,
                decoration: ShapeDecoration(
                  color: Colors.white.withValues(alpha: 201),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: const Color(0xFF836BFD)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'View',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
