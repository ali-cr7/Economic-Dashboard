import 'dart:convert';

import 'datum.dart';

class GerAgreedNegotiatonResponse {
	String? message;
	List<Datum>? data;

	GerAgreedNegotiatonResponse({this.message, this.data});

	factory GerAgreedNegotiatonResponse.from(Map<String, dynamic> data) {
		return GerAgreedNegotiatonResponse(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMessageDataId6ExpertId3PropertyForSaleId3TextOfTheAgreementBlaBlaBlaPaymentMechanismCashStatusCreatedAt20250519T000059000000ZUpdatedAt20250519T000117000000Z(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataId6ExpertId3PropertyForSaleId3TextOfTheAgreementBlaBlaBlaPaymentMechanismCashStatusCreatedAt20250519T000059000000ZUpdatedAt20250519T000117000000Z() {
		return {
			'message': message,
			'data': data?.map((e) => e.toMessageDataId6ExpertId3PropertyForSaleId3TextOfTheAgreementBlaBlaBlaPaymentMechanismCashStatusCreatedAt20250519T000059000000ZUpdatedAt20250519T000117000000Z()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GerAgreedNegotiatonResponse].
	factory GerAgreedNegotiatonResponse.fromJson(String data) {
		return GerAgreedNegotiatonResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GerAgreedNegotiatonResponse] to a JSON string.
	String toJson() => json.encode(toMessageDataId6ExpertId3PropertyForSaleId3TextOfTheAgreementBlaBlaBlaPaymentMechanismCashStatusCreatedAt20250519T000059000000ZUpdatedAt20250519T000117000000Z());
}
