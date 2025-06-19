import 'dart:io';

import 'package:dio/dio.dart';

class APIConfig {
  // static String baseUrl =
    static const String chatServiceUrl = 'http://localhost:3000/';
  static  String authServiceUrl = Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://127.0.0.1:8000/';
  
  // Default base URL (can be changed based on the service being used)
  static String baseUrl = authServiceUrl;
  
  // Method to switch to chat service
  static void useChatService() {
    baseUrl = chatServiceUrl;
  }
  
  // Method to switch to auth service
  static void useAuthService() {
    baseUrl = authServiceUrl;
  }
  
  // Method to set custom URL
  static void setBaseUrl(String url) {
    baseUrl = url;
  }

   static String getChatEndpoint(String endpoint) {
    return chatServiceUrl + endpoint;
  }
  
  // Helper method to get full URL for auth endpoints
  static String getAuthEndpoint(String endpoint) {
    return authServiceUrl + endpoint;
  }
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

  static const storeValueToIndicator = 'api/storeValueToIndicator/';
  static const getIndicators = 'api/getIndicators';

  static const updateValueOfIndicator = 'api/updateValueOfIndicator/';
  static const deleteValueOfIndicator = 'api/deleteValueOfIndicator/';
  static const storeIndicator = 'api/storeIndicator';
  static const updateIndicator = 'api/updateIndicator/';
  static const deleteIndicator = 'api/deleteIndicator/';
  static const currencyEndPoint = 'https://open.er-api.com/v6/latest/USD';

  // static const rejectedRequestsPercentageformlawyer =
  //     'api/rejected_Requests_Percentage_form_lawyer';
  // static const acceptedRequestsPercentageFromAdmin =
  //     'api/accepted_Requests_Percentage_from_admin';
  // static const rejectedRequestsPercentageFromUser =
  //     'api/rejected_Requests_Percentage_from_user';

  static const getRequestStatistics = 'api/get_Request_Statistics';
  static const successfulRequestsPercentageByMonthInYear =
      'api/successful_Requests_Percentage_ByMonth_in_year';

       static const String chatRoomsEndpoint = 'chat/rooms';
  static const String chatMessagesEndpoint = 'chat/message';
  static const String chatGetMessagesEndpoint = 'chat/messages';
  static const String userChatsEndpoint = 'user';
}
