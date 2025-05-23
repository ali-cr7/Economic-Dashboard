import 'dart:convert';

class Datum {
	int? id;
	int? expertId;
	int? propertyForSaleId;
	String? textOfTheAgreement;
	String? paymentMechanism;
	String? status;
	DateTime? createdAt;
	DateTime? updatedAt;

	Datum({
		this.id, 
		this.expertId, 
		this.propertyForSaleId, 
		this.textOfTheAgreement, 
		this.paymentMechanism, 
		this.status, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Datum.fromMessageDataId6ExpertId3PropertyForSaleId3TextOfTheAgreementBlaBlaBlaPaymentMechanismCashStatusCreatedAt20250519T000059000000ZUpdatedAt20250519T000117000000Z(Map<String, dynamic> data) {
		return Datum(
			id: data['id'] as int?,
			expertId: data['expert_id'] as int?,
			propertyForSaleId: data['property_for_sale_id'] as int?,
			textOfTheAgreement: data['Text_of_the_agreement'] as String?,
			paymentMechanism: data['Payment_Mechanism'] as String?,
			status: data['status'] as String?,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
		);
	}



	Map<String, dynamic> toMessageDataId6ExpertId3PropertyForSaleId3TextOfTheAgreementBlaBlaBlaPaymentMechanismCashStatusCreatedAt20250519T000059000000ZUpdatedAt20250519T000117000000Z() {
		return {
			'id': id,
			'expert_id': expertId,
			'property_for_sale_id': propertyForSaleId,
			'Text_of_the_agreement': textOfTheAgreement,
			'Payment_Mechanism': paymentMechanism,
			'status': status,
			'created_at': createdAt?.toIso8601String(),
			'updated_at': updatedAt?.toIso8601String(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMessageDataId6ExpertId3PropertyForSaleId3TextOfTheAgreementBlaBlaBlaPaymentMechanismCashStatusCreatedAt20250519T000059000000ZUpdatedAt20250519T000117000000Z(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMessageDataId6ExpertId3PropertyForSaleId3TextOfTheAgreementBlaBlaBlaPaymentMechanismCashStatusCreatedAt20250519T000059000000ZUpdatedAt20250519T000117000000Z());
}
