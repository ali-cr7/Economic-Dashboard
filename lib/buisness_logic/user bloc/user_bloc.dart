import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/log_in_response/log_in_response.dart';
import 'package:economic_team_desktop/data/services/auth%20services/auth_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';


part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepoImpl authRepoImpl;
  UserBloc(this.authRepoImpl) : super(UserInitial()) {

    on<LogInEvent>((event, emit) async {
      emit(UserLoading());
   //   final fcm = await FirebaseMessaging.instance.getToken();
  //    print('here is the device token :$fcm');
      final response = await authRepoImpl.logIn(event, 'fcm'!);

      if (response is LogInResponse) {
        emit(UserLoginState(user: response));
        print('hiii');
        print(response.token);
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });
    on<ResetPasswordEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.resetPassword(event);

      if (response is String) {
        print('hjjj lll');
        emit(ResetSuccessState(message: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<SendVerificationCodeEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.sendVerificationCode(event);

      if (response is String) {
        emit(SendVerificationSuccessState(message: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });

    on<VerifyCodeEvent>((event, emit) async {
      emit(UserLoading());
      final response = await authRepoImpl.verifyCode(event);

      if (response is String) {
        emit(VerifiySuccessState(message: response));
      } else {
        emit(UserErrorState(helperResponse: response));
      }
    });
  }
}
