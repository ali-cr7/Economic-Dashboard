part of 'create_property_indicators_bloc.dart';

@immutable
sealed class CreatePropertyIndicatorsEvent {
   const CreatePropertyIndicatorsEvent();
  List<Object?> get props => [];
}

class UpdateResidentialCapRateEvent extends CreatePropertyIndicatorsEvent {
  final double netOperatingIncome;
  final double propertyValue;

  const UpdateResidentialCapRateEvent({
    required this.netOperatingIncome,
    required this.propertyValue,
  });

  @override
  List<Object?> get props => [netOperatingIncome, propertyValue];
}

class UpdateCommercialCapRateEvent extends CreatePropertyIndicatorsEvent {
  final double netOperatingIncome;
  final double propertyValue;

  const UpdateCommercialCapRateEvent({
    required this.netOperatingIncome,
    required this.propertyValue,
  });

  @override
  List<Object?> get props => [netOperatingIncome, propertyValue];
}

class UpdateCashOnCashReturnEvent extends CreatePropertyIndicatorsEvent {
  final double annualCashFlow;
  final double cashInvested;

  const UpdateCashOnCashReturnEvent({
    required this.annualCashFlow,
    required this.cashInvested,
  });

  @override
  List<Object?> get props => [annualCashFlow, cashInvested];
}

class UpdateInternalRateOfReturnEvent extends CreatePropertyIndicatorsEvent {
  final List<double> cashFlows;

  const UpdateInternalRateOfReturnEvent({required this.cashFlows});

  @override
  List<Object?> get props => [cashFlows];
}

class UpdateVacancyRateEvent extends CreatePropertyIndicatorsEvent {
  final int vacantUnits;
  final int totalUnits;

  const UpdateVacancyRateEvent({
    required this.vacantUnits,
    required this.totalUnits,
  });

  @override
  List<Object?> get props => [vacantUnits, totalUnits];
}

class UpdateOperatingExpenseRatioEvent extends CreatePropertyIndicatorsEvent {
  final double operatingExpenses;
  final double netOperatingIncome;

  const UpdateOperatingExpenseRatioEvent({
    required this.operatingExpenses,
    required this.netOperatingIncome,
  });

  @override
  List<Object?> get props => [operatingExpenses, netOperatingIncome];
}