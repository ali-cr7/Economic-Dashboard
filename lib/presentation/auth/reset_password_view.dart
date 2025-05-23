import 'package:economic_team_desktop/buisness_logic/user%20bloc/user_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/auth/widgets/custom_buttom.dart';
import 'package:economic_team_desktop/presentation/auth/widgets/custom_textfield.dart';
import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:economic_team_desktop/utility/dialogs_snackBar.dart';
import 'package:economic_team_desktop/utility/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1728, 1117));
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoading) {
          EasyLoading.show(status: 'loading...');
        }

        if (state is ResetSuccessState) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Password Changed successfully!');
          GoRouter.of(context).push(AppRouter.kHomePageView);
        }
        if (state is UserErrorState) {
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
            context: context,
            helperResponse: state.helperResponse,
            showServerError: true,
          );
        }
      },
      child: Container(
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
                            padding: EdgeInsets.only(left: 50.0.w),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Reset your password ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 90.h),

                          // Email field using CustomTextField
                          CustomTextField(
                            controller: passwordController,
                            hintText: "new password",
                            icon: Icons.visibility_off,
                            isPassword: true,
                          ),
                          SizedBox(height: 30.h),

                          // Password field using CustomTextField
                          CustomTextField(
                            controller: passwordConfirmController,
                            hintText: "confirm new Password",
                            icon: Icons.visibility_off,
                            isPassword: true,
                          ),
                          SizedBox(height: 50.h),
                          // Login button using CustomButton
                          CustomButton(
                            onPressed: () {
                              context.read<UserBloc>().add(
                                ResetPasswordEvent(
                                  passWordConfirm:
                                      passwordConfirmController.text,
                                  password: passwordController.text,
                                  email: email!,
                                ),
                              );
                            },
                            text: 'Reset',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
