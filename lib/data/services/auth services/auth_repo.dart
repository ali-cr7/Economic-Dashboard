import 'package:economic_team_desktop/buisness_logic/user%20bloc/user_bloc.dart';


abstract class AuthRepo {

  Future logIn(LogInEvent event, String fcm);
  Future sendVerificationCode(SendVerificationCodeEvent event);
  Future resetPassword(ResetPasswordEvent event);
  Future verifyCode(VerifyCodeEvent event);
  Future storeFcmToken(String fcm);
}
