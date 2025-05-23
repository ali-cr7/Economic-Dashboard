import 'package:economic_team_desktop/buisness_logic/user%20bloc/user_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/auth/widgets/custom_buttom.dart';
import 'package:economic_team_desktop/presentation/auth/widgets/custom_textfield.dart';
import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:economic_team_desktop/utility/dialogs_snackBar.dart';
import 'package:economic_team_desktop/utility/router.dart' show AppRouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ConfirmEmailView extends StatefulWidget {
  const ConfirmEmailView({super.key});

  @override
  State<ConfirmEmailView> createState() => _ConfirmEmailViewState();
}

class _ConfirmEmailViewState extends State<ConfirmEmailView> {
  TextEditingController codeController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1728, 1117));
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoading) {
          EasyLoading.show(status: 'loading...');
        }
        if (state is SendVerificationSuccessState) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Code Sent successfully!');
          //  GoRouter.of(context).push(AppRouter.kResetPasswordView);
        }
        if (state is UserErrorState) {
          EasyLoading.dismiss();
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
            context: context,
            helperResponse: state.helperResponse,
            showServerError: true,
          );
        }
        if (state is VerifiySuccessState) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Code Sent successfully!');
          GoRouter.of(context).pushReplacement(AppRouter.kResetPasswordView);
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
                                  text: 'Confirm your email ',
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
                            controller: codeController,
                            hintText: "Check Code",
                            icon: Icons.code,
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(right: 16.0.w),
                            child: InkWell(
                              onTap: () {
                                GoRouter.of(context).push('/');
                              },
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Back to ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'logIn?',
                                      style: TextStyle(
                                        color: const Color(0xFF4725F2),
                                        fontSize: 14.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Password field using CustomTextField
                          SizedBox(height: 10.h),
                          // Login button using CustomButton
                          CustomButton(
                            onPressed: () {
                              context.read<UserBloc>().add(
                                VerifyCodeEvent(
                                  email: email!,
                                  code: codeController.text,
                                ),
                              );
                            },
                            text: 'Check',
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
