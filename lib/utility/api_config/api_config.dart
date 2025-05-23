import 'dart:io';

import 'package:dio/dio.dart';

class APIConfig {
  static String baseUrl =
      // 'http:// 192.168.119.1/';
      Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://127.0.0.1:8000/';
  static const String logInEndpoint = 'api/login';
  static const String sendVerificationCode = 'api/send_verification_code';
  static const String verifyCode = 'api/verify_code';
  static const String resetPassword = 'api/reset_password';
  static const String getAllRequestFromLawyer =
      'api/get_all_request_from_lawyer';
  static const String getFcmToken = 'api/storeFcmToken';
  static const String getRequestsDetails =
      'api/get_propertyBy_request_from_lawyer/';
  static const createRequest = 'api/create_request_from_expert';
  static const createNegotiationOffer = 'api/create_Agreed_Negotiation';



  static const updateRequest = 'api/update_request_from_expert/';
  static const updateNegotiationOffer = 'api/update_Agreed_Negotiation/';
  static const getAgreedNegotiationforProperty =
      'api/get_Agreed_Negotiation_for_property/';
}
