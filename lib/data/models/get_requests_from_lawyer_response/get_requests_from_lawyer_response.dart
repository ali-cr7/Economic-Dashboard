import 'dart:convert';

import 'datum.dart';

class GetRequestsFromLawyerResponse {
	String? message;
	List<RequestsModel>? data;

	GetRequestsFromLawyerResponse({this.message, this.data});

	factory GetRequestsFromLawyerResponse.from(Map<String, dynamic> data) {
		return GetRequestsFromLawyerResponse(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => RequestsModel.fromMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah() {
		return {
			'message': message,
			'data': data?.map((e) => e.toMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetRequestsFromLawyerResponse].
	factory GetRequestsFromLawyerResponse.fromJson(String data) {
		return GetRequestsFromLawyerResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GetRequestsFromLawyerResponse] to a JSON string.
	String toJson() => json.encode(toMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah());
}
