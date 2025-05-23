part of 'create_economic_study_bloc.dart';

@immutable
class CreateEconomicStudyState {
  final int requestFromLawyerId;

  final int numberOfChances;
  final double expectedPrice;
  final double profitPercent;
  final double totalExpectedTaxes;
  final double buyingPrice;
  final double rentingPrice;
  final double chancePrice;
  final String investmentTime;
  final String incomingTime;
  final String investmentMode;
  final String propertyManagement;
  final int propertyForSaleId;
  final int agreedNegotiationId;

  const CreateEconomicStudyState({
    this.requestFromLawyerId = 1,
    this.numberOfChances = 0,
    this.expectedPrice = 0.0,
    this.profitPercent = 1.0,
    this.totalExpectedTaxes = 0.0,
    this.buyingPrice = 0.0,
    this.rentingPrice = 0.0,
    this.chancePrice = 0.0,
    this.investmentTime = '2025-06-01',
    this.incomingTime = '2025-05-01',
    this.investmentMode = 'Balanced',
    this.propertyManagement = 'rent',
    this.propertyForSaleId = 1,
    this.agreedNegotiationId = 1,
  });

  Map<String, dynamic> toMap() => {
    'request_from_lawyer_id': requestFromLawyerId,
    'economic_evaluation': {
      'number_of_chances': numberOfChances,
      'expected_price': expectedPrice,
      'profit_percent': profitPercent,
      'total_expected_taxes': totalExpectedTaxes,
      'buying_price': buyingPrice,
      'renting_price': rentingPrice,
      'chance_price': chancePrice,
      'investment_time': investmentTime,
      'incoming_time': incomingTime,
      'investment_mode': investmentMode,
      'property_management': propertyManagement,
      'property_for_sale_id': propertyForSaleId,
      'agreed_negotiation_id': agreedNegotiationId,
    },
  };

  String toJson() => json.encode(toMap());

  factory CreateEconomicStudyState.fromMap(Map<String, dynamic> map) {
    final economic = map['economic_evaluation'] ?? {};
    return CreateEconomicStudyState(
      requestFromLawyerId: map['request_from_lawyer_id'] ?? 0,
      numberOfChances: economic['number_of_chances'] ?? 0,
      expectedPrice: (economic['expected_price'] ?? 0).toDouble(),
      profitPercent: (economic['profit_percent'] ?? 0).toDouble(),
      totalExpectedTaxes: (economic['total_expected_taxes'] ?? 0).toDouble(),
      buyingPrice: (economic['buying_price'] ?? 0).toDouble(),
      rentingPrice: (economic['renting_price'] ?? 0).toDouble(),
      chancePrice: (economic['chance_price'] ?? 0).toDouble(),
      investmentTime: economic['investment_time'] ?? '',
      incomingTime: economic['incoming_time'] ?? '',
      investmentMode: economic['investment_mode'] ?? 'Balanced',
      propertyManagement: economic['property_management'] ?? 'rent',
      propertyForSaleId: economic['property_for_sale_id'] ?? 0,
      agreedNegotiationId: economic['agreed_negotiation_id'] ?? 0,
    );
  }

  factory CreateEconomicStudyState.fromJson(String source) =>
      CreateEconomicStudyState.fromMap(json.decode(source));

  CreateEconomicStudyState copyWith({
    int? requestFromLawyerId,
    int? numberOfChances,
    double? expectedPrice,
    double? profitPercent,
    double? totalExpectedTaxes,
    double? buyingPrice,
    double? rentingPrice,
    double? chancePrice,
    String? investmentTime,
    String? incomingTime,
    String? investmentMode,
    String? propertyManagement,
    int? propertyForSaleId,
    int? agreedNegotiationId,
  }) {
    return CreateEconomicStudyState(
      requestFromLawyerId: requestFromLawyerId ?? this.requestFromLawyerId,
      numberOfChances: numberOfChances ?? this.numberOfChances,
      expectedPrice: expectedPrice ?? this.expectedPrice,
      profitPercent: profitPercent ?? this.profitPercent,
      totalExpectedTaxes: totalExpectedTaxes ?? this.totalExpectedTaxes,
      buyingPrice: buyingPrice ?? this.buyingPrice,
      rentingPrice: rentingPrice ?? this.rentingPrice,
      chancePrice: chancePrice ?? this.chancePrice,
      investmentTime: investmentTime ?? this.investmentTime,
      incomingTime: incomingTime ?? this.incomingTime,
      investmentMode: investmentMode ?? this.investmentMode,
      propertyManagement: propertyManagement ?? this.propertyManagement,
      propertyForSaleId: propertyForSaleId ?? this.propertyForSaleId,
      agreedNegotiationId: agreedNegotiationId ?? this.agreedNegotiationId,
    );
  }

  Future<FormData> toFormData() async {
    return FormData.fromMap(toMap());
  }

  @override
  String toString() {
    return 'CreateEconomicStudyState(requestFromLawyerId: $requestFromLawyerId, '
        'numberOfChances: $numberOfChances, expectedPrice: $expectedPrice, '
        'profitPercent: $profitPercent, totalExpectedTaxes: $totalExpectedTaxes, '
        'buyingPrice: $buyingPrice, rentingPrice: $rentingPrice, chancePrice: $chancePrice, '
        'investmentTime: $investmentTime, incomingTime: $incomingTime, '
        'investmentMode: $investmentMode, propertyManagement: $propertyManagement, '
        'propertyForSaleId: $propertyForSaleId, agreedNegotiationId: $agreedNegotiationId)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateEconomicStudyState &&
          runtimeType == other.runtimeType &&
          requestFromLawyerId == other.requestFromLawyerId &&
          numberOfChances == other.numberOfChances &&
          expectedPrice == other.expectedPrice &&
          profitPercent == other.profitPercent &&
          totalExpectedTaxes == other.totalExpectedTaxes &&
          buyingPrice == other.buyingPrice &&
          rentingPrice == other.rentingPrice &&
          chancePrice == other.chancePrice &&
          investmentTime == other.investmentTime &&
          incomingTime == other.incomingTime &&
          investmentMode == other.investmentMode &&
          propertyManagement == other.propertyManagement &&
          propertyForSaleId == other.propertyForSaleId &&
          agreedNegotiationId == other.agreedNegotiationId;

  @override
  int get hashCode => Object.hash(
    requestFromLawyerId,
    numberOfChances,
    expectedPrice,
    profitPercent,
    totalExpectedTaxes,
    buyingPrice,
    rentingPrice,
    chancePrice,
    investmentTime,
    incomingTime,
    investmentMode,
    propertyManagement,
    propertyForSaleId,
    agreedNegotiationId,
  );
}

final class CreateEconomicStudyInitial extends CreateEconomicStudyState {}
