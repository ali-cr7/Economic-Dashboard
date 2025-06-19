import 'dart:convert';

import 'datum.dart';

class GetRequestsFromLawyerResponse {
  String? message;
  List<RequestsModel>? data;

  GetRequestsFromLawyerResponse({this.message, this.data});

  factory GetRequestsFromLawyerResponse.from(Map<String, dynamic> data) {
    return GetRequestsFromLawyerResponse(
      message: data['message'] as String?,
      data:
          (data['data'] as List<dynamic>?)
              ?.map(
                (e) =>
                    RequestsModel.fromMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusPropertyInfoLatakiaJablahRequestFromLawyerId2PropertyForSaleId2StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId3PropertyForSaleId3StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId4PropertyForSaleId4StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusPropertyInfoLatakiaJablahRequestFromLawyerId5PropertyForSaleId5StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId6PropertyForSaleId6StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId7PropertyForSaleId7StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250609AgreedNegotiationStatusNullPropertyInfoTartousJablahRequestFromLawyerId8PropertyForSaleId8StatusRequestAcceptAdminByWhomLawyerUserNameInvestorCreatedAt20250611AgreedNegotiationStatusNullPropertyInfoHamaRabieaRequestFromLawyerId9PropertyForSaleId1StatusRequestAcceptAdminByWhomAdminUserNameInvestorCreatedAt20250611AgreedNegotiationStatusPropertyInfoLatakiaJablahRequestFromLawyerId10PropertyForSaleId1StatusRequestAcceptAdminByWhomAdminUserNameInvestorCreatedAt20250611AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId11PropertyForSaleId1StatusRequestAcceptAdminByWhomAdminUserNameInvestorCreatedAt20250611AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId12PropertyForSaleId9StatusRequestAcceptAdminByWhomLawyerUserNameInvestorCreatedAt20250612AgreedNegotiationStatusNullPropertyInfoHomsRabiea(
                      e as Map<String, dynamic>,
                    ),
              )
              .toList(),
    );
  }

  Map<String, dynamic>
  toMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah() {
    return {
      'message': message,
      'data':
          data
              ?.map(
                (e) =>
                    e.toMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusPropertyInfoLatakiaJablahRequestFromLawyerId2PropertyForSaleId2StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId3PropertyForSaleId3StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId4PropertyForSaleId4StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusPropertyInfoLatakiaJablahRequestFromLawyerId5PropertyForSaleId5StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId6PropertyForSaleId6StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250607AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId7PropertyForSaleId7StatusRequestAcceptAdminByWhomUserNameInvestorCreatedAt20250609AgreedNegotiationStatusNullPropertyInfoTartousJablahRequestFromLawyerId8PropertyForSaleId8StatusRequestAcceptAdminByWhomLawyerUserNameInvestorCreatedAt20250611AgreedNegotiationStatusNullPropertyInfoHamaRabieaRequestFromLawyerId9PropertyForSaleId1StatusRequestAcceptAdminByWhomAdminUserNameInvestorCreatedAt20250611AgreedNegotiationStatusPropertyInfoLatakiaJablahRequestFromLawyerId10PropertyForSaleId1StatusRequestAcceptAdminByWhomAdminUserNameInvestorCreatedAt20250611AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId11PropertyForSaleId1StatusRequestAcceptAdminByWhomAdminUserNameInvestorCreatedAt20250611AgreedNegotiationStatusNullPropertyInfoLatakiaJablahRequestFromLawyerId12PropertyForSaleId9StatusRequestAcceptAdminByWhomLawyerUserNameInvestorCreatedAt20250612AgreedNegotiationStatusNullPropertyInfoHomsRabiea(),
              )
              .toList(),
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetRequestsFromLawyerResponse].
  factory GetRequestsFromLawyerResponse.fromJson(String data) {
    return GetRequestsFromLawyerResponse.from(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [GetRequestsFromLawyerResponse] to a JSON string.
  String toJson() => json.encode(
    toMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah(),
  );
}
