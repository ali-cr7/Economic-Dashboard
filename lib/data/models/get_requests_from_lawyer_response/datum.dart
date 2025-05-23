import 'dart:convert';

class RequestsModel {
	int? requestFromLawyerId;
	int? propertyForSaleId;
	String? statusRequest;
	String? acceptAdmin;
	String? userName;
	String? createdAt;
	dynamic agreedNegotiationStatus;
	String? propertyInfo;

	RequestsModel({
		this.requestFromLawyerId, 
		this.propertyForSaleId, 
		this.statusRequest, 
		this.acceptAdmin, 
		this.userName, 
		this.createdAt, 
		this.agreedNegotiationStatus, 
		this.propertyInfo, 
	});

	factory RequestsModel.fromMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah(Map<String, dynamic> data) {
		return RequestsModel(
			requestFromLawyerId: data['request_from_lawyer_id'] as int?,
			propertyForSaleId: data['property_for_sale_id'] as int?,
			statusRequest: data['status_request'] as String?,
			acceptAdmin: data['accept_admin'] as String?,
			userName: data['user_name'] as String?,
			createdAt: data['created_at'] as String?,
			agreedNegotiationStatus: data['agreed_negotiation_status'] as dynamic,
			propertyInfo: data['property_info'] as String?,
		);
	}



	Map<String, dynamic> toMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah() {
		return {
			'request_from_lawyer_id': requestFromLawyerId,
			'property_for_sale_id': propertyForSaleId,
			'status_request': statusRequest,
			'accept_admin': acceptAdmin,
			'user_name': userName,
			'created_at': createdAt,
			'agreed_negotiation_status': agreedNegotiationStatus,
			'property_info': propertyInfo,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory RequestsModel.fromJson(String data) {
		return RequestsModel.fromMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMessageDataRequestFromLawyerId1PropertyForSaleId1StatusRequestAcceptAdminUserNameInvestorCreatedAt20250516AgreedNegotiationStatusNullPropertyInfoLatakiaJablah());
}
