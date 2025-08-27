import 'dart:convert';

class Datum {
  int? userId;
  String? userName;
  String? propertyInfo;
  int? requestId;
  int? propertyForSaleId;
  String? statusRequest;
  String? acceptAdmin;
  String? createdAt;
  AgreedNegotiation? agreedNegotiation;

  Datum({
    this.userId,
    this.userName,
    this.propertyInfo,
    this.requestId,
    this.propertyForSaleId,
    this.statusRequest,
    this.acceptAdmin,
    this.createdAt,
    this.agreedNegotiation,
  });

  factory Datum.f(Map<String, dynamic> data) {
    return Datum(
      userId: data['user_id'] as int?,
      userName: data['user_name'] as String?,
      propertyInfo: data['property_info'] as String?,
      requestId: data['requestId'] as int?,
      propertyForSaleId: data['property_for_sale_id'] as int?,
      statusRequest: data['status_request'] as String?,
      acceptAdmin: data['accept_admin'] as String?,
      createdAt: data['created_at'] as String?,
      agreedNegotiation: data['agreed_negotiation'] != null
          ? AgreedNegotiation.f(data['agreed_negotiation'])
          : null,
    );
  }

  Map<String, dynamic> t() {
    return {
      'user_id': userId,
      'user_name': userName,
      'property_info': propertyInfo,
      'requestId': requestId,
      'property_for_sale_id': propertyForSaleId,
      'status_request': statusRequest,
      'accept_admin': acceptAdmin,
      'created_at': createdAt,
      'agreed_negotiation': agreedNegotiation?.t(),
    };
  }

  factory Datum.fromJson(String data) {
    return Datum.f(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(t());
}

class AgreedNegotiation {
  int? id;
  String? status;
  String? textOfTheAgreement;
  String? createdAt;

  AgreedNegotiation({
    this.id,
    this.status,
    this.textOfTheAgreement,
    this.createdAt,
  });

  factory AgreedNegotiation.f(Map<String, dynamic> data) {
    return AgreedNegotiation(
      id: data['id'] as int?,
      status: data['status'] as String?,
      textOfTheAgreement: data['text_of_the_agreement'] as String?,
      createdAt: data['created_at'] as String?,
    );
  }

  Map<String, dynamic> t() {
    return {
      'id': id,
      'status': status,
      'text_of_the_agreement': textOfTheAgreement,
      'created_at': createdAt,
    };
  }
}