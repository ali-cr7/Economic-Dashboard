import 'dart:convert';

import 'datum.dart';

class UserSaleRequestsResponse {
	String? message;
	List<Datum>? data;

	UserSaleRequestsResponse({this.message, this.data});

	factory UserSaleRequestsResponse.from(Map<String, dynamic> data) {
		return UserSaleRequestsResponse(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.f(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataUserId1UserNameInvestorPropertyInfoIdlibGggggggggggggggRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminCreatedAt20250702AgreedNegotiationStatusNullUserId1UserNameInvestorPropertyInfoTartusHosenAlBaharRequestFromLawyerId2PropertyForSaleId2StatusRequestAcceptAdminCreatedAt20250702AgreedNegotiationStatusNullUserId1UserNameInvestorPropertyInfoTartusHosenAlBaharRequestFromLawyerId3PropertyForSaleId3StatusRequestAcceptAdminCreatedAt20250702AgreedNegotiationStatusNull() {
		return {
			'message': message,
			'data': data?.map((e) => e.t()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserSaleRequestsResponse].
	factory UserSaleRequestsResponse.fromJson(String data) {
		return UserSaleRequestsResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [UserSaleRequestsResponse] to a JSON string.
	String toJson() => json.encode(toMessageDataUserId1UserNameInvestorPropertyInfoIdlibGggggggggggggggRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminCreatedAt20250702AgreedNegotiationStatusNullUserId1UserNameInvestorPropertyInfoTartusHosenAlBaharRequestFromLawyerId2PropertyForSaleId2StatusRequestAcceptAdminCreatedAt20250702AgreedNegotiationStatusNullUserId1UserNameInvestorPropertyInfoTartusHosenAlBaharRequestFromLawyerId3PropertyForSaleId3StatusRequestAcceptAdminCreatedAt20250702AgreedNegotiationStatusNull());
}
