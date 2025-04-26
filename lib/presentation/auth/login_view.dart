import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/auth/widgets/custom_buttom.dart';
import 'package:economic_team_desktop/presentation/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:economic_team_desktop/utility/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1728, 1117));

    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: 1306.w,
            height: 750.h,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.74),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Row(
              children: [
                // Left side - Background image
                Container(child: Assets.images.authBackground.image()),

                // Right side - Form
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                text: 'Welcome again in ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'EI',
                                    style: TextStyle(
                                      color: Color(0xFF836BFD),
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 90.h),

                        // Email field using CustomTextField
                        CustomTextField(
                          hintText: "Email",
                          icon: Icons.email_outlined,
                        ),
                        SizedBox(height: 30.h),

                        // Password field using CustomTextField
                        CustomTextField(
                          hintText: "Password",
                          icon: Icons.visibility_off,
                          isPassword: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'forget ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'password?',
                                  style: TextStyle(
                                    color: const Color(0xFF4725F2),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h),

                        // Login button using CustomButton
                        CustomButton(onPressed: () {}, text: 'login'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
