part of 'create_economic_study_bloc.dart';

@immutable
sealed class CreateEconomicStudyEvent {
  const CreateEconomicStudyEvent();

  List<Object?> get props => [];
}

class UpdateNumberOfChancesEvent extends CreateEconomicStudyEvent {
  final int numberOfChances;
  final int requestFromLawyerId;
  final int propertyForSaleId;
  final int agreedNegotiationId;

  const UpdateNumberOfChancesEvent(this.requestFromLawyerId, this.propertyForSaleId, this.agreedNegotiationId, {required this.numberOfChances});

  @override
  List<Object?> get props => [numberOfChances,propertyForSaleId,requestFromLawyerId,agreedNegotiationId];
}

class UpdateExpectedPriceEvent extends CreateEconomicStudyEvent {
  final double expectedPrice;

  const UpdateExpectedPriceEvent({required this.expectedPrice});

  @override
  List<Object?> get props => [expectedPrice];
}

class UpdateProfitPercentEvent extends CreateEconomicStudyEvent {
  final double profitPercent;

  const UpdateProfitPercentEvent({required this.profitPercent});

  @override
  List<Object?> get props => [profitPercent];
}

class UpdateTotalExpectedTaxesEvent extends CreateEconomicStudyEvent {
  final double totalExpectedTaxes;

  const UpdateTotalExpectedTaxesEvent({required this.totalExpectedTaxes});

  @override
  List<Object?> get props => [totalExpectedTaxes];
}

class UpdateBuyingPriceEvent extends CreateEconomicStudyEvent {
  final double buyingPrice;

  const UpdateBuyingPriceEvent({required this.buyingPrice});

  @override
  List<Object?> get props => [buyingPrice];
}

class UpdateRentingPriceEvent extends CreateEconomicStudyEvent {
  final double rentingPrice;

  const UpdateRentingPriceEvent({required this.rentingPrice});

  @override
  List<Object?> get props => [rentingPrice];
}

class UpdateChancePriceEvent extends CreateEconomicStudyEvent {
  final double chancePrice;

  const UpdateChancePriceEvent({required this.chancePrice});

  @override
  List<Object?> get props => [chancePrice];
}

class UpdateInvestmentTimeEvent extends CreateEconomicStudyEvent {
  final String investmentTime;

  const UpdateInvestmentTimeEvent({required this.investmentTime});

  @override
  List<Object?> get props => [investmentTime];
}

class UpdateIncomingTimeEvent extends CreateEconomicStudyEvent {
  final String incomingTime;

  const UpdateIncomingTimeEvent({required this.incomingTime});

  @override
  List<Object?> get props => [incomingTime];
}

class UpdateInvestmentModeEvent extends CreateEconomicStudyEvent {
  final String investmentMode;

  const UpdateInvestmentModeEvent({required this.investmentMode});

  @override
  List<Object?> get props => [investmentMode];
}

class UpdatePropertyManagementEvent extends CreateEconomicStudyEvent {
  final String propertyManagement;

  const UpdatePropertyManagementEvent({required this.propertyManagement});

  @override
  List<Object?> get props => [propertyManagement];
}

class UpdatePropertyForSaleIdEvent extends CreateEconomicStudyEvent {
  final int propertyForSaleId;

  const UpdatePropertyForSaleIdEvent({required this.propertyForSaleId});

  @override
  List<Object?> get props => [propertyForSaleId];
}

class UpdateAgreedNegotiationIdEvent extends CreateEconomicStudyEvent {
  final int agreedNegotiationId;

  const UpdateAgreedNegotiationIdEvent({required this.agreedNegotiationId});

  @override
  List<Object?> get props => [agreedNegotiationId];
}

class UpdaterequestFromLawyerIdIdEvent extends CreateEconomicStudyEvent {
  final int requestFromLawyerId;

  const UpdaterequestFromLawyerIdIdEvent({required this.requestFromLawyerId});

  @override
  List<Object?> get props => [requestFromLawyerId];
}
