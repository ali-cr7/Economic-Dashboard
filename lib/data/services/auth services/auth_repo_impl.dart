import 'dart:convert';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:economic_team_desktop/buisness_logic/user%20bloc/user_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/data/models/log_in_response/log_in_response.dart';
import 'package:economic_team_desktop/data/services/auth%20services/auth_repo.dart';
import 'package:economic_team_desktop/enums.dart';
import 'package:economic_team_desktop/firebase_options.dart';
import 'package:economic_team_desktop/utility/api_config/api_config.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:economic_team_desktop/utility/handle_cash.dart';
//import 'package:firebase_core/firebase_core.dart';

import 'package:hive/hive.dart';
 //import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  // Future<void> createUserInFirestore(
  //   String uid,
  //   String email,
  //   String name,
  // ) async {
  //   try {
  //     await FirebaseFirestore.instance.collection('users').doc(uid).set({
  //       'id': uid,
  //       'email': email,
  //       'name': name,
  //       'createdAt': FieldValue.serverTimestamp(),
  //       'lastSeen': FieldValue.serverTimestamp(),
  //       'isOnline': true,
  //     });
  //   } catch (e) {
  //     print('Error creating user in Firestore: $e');
  //   }
  // }

  @override
  Future logIn(LogInEvent event, String fcm) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.logInEndpoint,
      data: {'email': event.email, 'password': event.password},
    );

    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        LogInResponse logInResponse = LogInResponse.from(
          helperResponse.fullBody!,
        );
        print('✅ Backend login successful');
        print('📦 Full backend response: ${helperResponse.fullBody}');
        print('📨 Message from backend: ${logInResponse.message}');

        await setCache(logInResponse);
        //  await storeFcmToken(fcm);
       
        // if (logInResponse.firebaseToken == null) {
        //   print('❌ Firebase token is null!');
        // } else {
        //   try {
          
        //     final userCredential = await FirebaseAuth.instance
        //         .signInWithCustomToken(logInResponse.firebaseToken!);
        //     //   print(userCredential.user!.uid);

        //     print("Sign-in successful.");
        //     await createUserInFirestore(
        //       logInResponse.uid!,
        //       event.email,
        //       logInResponse.data?.name ?? 'User',
        //     );
        //   } on FirebaseException catch (e) {
        //     print(e.message);
        //     switch (e.code) {
        //       case "invalid-custom-token":
        //         print(
        //           "The supplied token is not a Firebase custom auth token.",
        //         );
        //         break;
        //       case "custom-token-mismatch":
        //         print(
        //           "The supplied token is for a different Firebase project.",
        //         );
        //         break;
        //       default:
        //         print("Unknown error.");
        //     }
        //   }
        // }

        return logInResponse;
      } catch (e) {
        print('❌ Error during login process: $e');
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    print(
      '❌ Backend login failed with status: ${helperResponse.servicesResponse}',
    );
    return helperResponse;
  }

  @override
  Future resetPassword(ResetPasswordEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.resetPassword,
      data: {
        'email': event.email,
        'password': event.password,
        'password_confirmation': event.passWordConfirm,
      },
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future sendVerificationCode(SendVerificationCodeEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.sendVerificationCode,
      data: {'email': event.email},
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future verifyCode(VerifyCodeEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.verifyCode,
      data: {'email': event.email, 'verification_code': event.code},
    );
    //  print(helperResponse.servicesResponse);
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future storeFcmToken(String fcm) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.getFcmToken,
      data: {'fcm_token': fcm},
      token: token,
    );
    print('here is the response of saving the fcm:${helperResponse.fullBody}');
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        final responseBody = helperResponse.fullBody;
        return responseBody?['message'];
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }
}
