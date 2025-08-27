import 'dart:io';

import 'package:dio/dio.dart';

class APIConfig {
  // static String baseUrl =
  static const String chatServiceUrl = 'http://localhost:3000/';
  static String authServiceUrl = 'http://127.0.0.1:8000/';
  // Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://127.0.0.1:8000/';

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

  static const String logInEndpoint = 'api/v1/login';
  static const String sendVerificationCode = 'api/v1/send_verification_code';
  static const String verifyCode = 'api/v1/verify_code';
  static const String resetPassword = 'api/v1/reset_password';
  static const String getAllRequestFromLawyer =
      'api/v1/get_all_request_from_lawyer';
  static const String getFcmToken = 'api/v1/storeFcmToken';
  static const String getRequestsDetails =
      'api/v1/get_propertyBy_request_from_lawyer/';
  static const createRequest = 'api/v1/create_request_from_expert';
  static const createNegotiationOffer = 'api/v1/create_Agreed_Negotiation';
  static const updateRequest = 'api/v1/update_request_from_expert/';
  static const updateNegotiationOffer = 'api/v1/update_Agreed_Negotiation/';
  static const getAgreedNegotiationforProperty =
      'api/v1/get_Agreed_Negotiation_for_property/';

  static const storeValueToIndicator = 'api/v1/storeValueToIndicator';
  static const getIndicators = 'api/v1/getIndicators';

  static const updateValueOfIndicator = 'api/v1/updateValueOfIndicator/';
  static const deleteValueOfIndicator = 'api/v1/deleteValueOfIndicator/';
  static const storeIndicator = 'api/v1/storeIndicator';
  static const updateIndicator = 'api/v1/updateIndicator/';
  static const deleteIndicator = 'api/v1/deleteIndicator/';
  static const currencyEndPoint = 'https://open.er-api.com/v6/latest/USD';

  // static const rejectedRequestsPercentageformlawyer =
  //     'api/v1/rejected_Requests_Percentage_form_lawyer';
  // static const acceptedRequestsPercentageFromAdmin =
  //     'api/v1/accepted_Requests_Percentage_from_admin';
  // static const rejectedRequestsPercentageFromUser =
  //     'api/v1/rejected_Requests_Percentage_from_user';

  static const getRequestStatistics = 'api/v1/get_Request_Statistics';
  static const successfulRequestsPercentageByMonthInYear =
      'api/v1/successful_Requests_Percentage_ByMonth_in_year';

  static const String chatRoomsEndpoint = 'chat/rooms';
  static const String chatMessagesEndpoint = 'chat/message';
  static const String chatGetMessagesEndpoint = 'chat/messages';
  static const String userChatsEndpoint = 'user';
  static const String getUserSalesRequest =
      "api/v1/get_all_request_from_lawyer_for_user/";
  static const String getPostedProperties =
      'api/v1/get_investment_property_info';
}

