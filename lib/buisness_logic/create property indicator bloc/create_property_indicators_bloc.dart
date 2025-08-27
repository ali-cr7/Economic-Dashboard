import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'create_property_indicators_event.dart';
part 'create_property_indicators_state.dart';

class CreatePropertyIndicatorsBloc extends Bloc<CreatePropertyIndicatorsEvent, CreatePropertyIndicatorsState> {
  CreatePropertyIndicatorsBloc() : super(CreatePropertyIndicatorsInitial()) {
   
      on<UpdateResidentialCapRateEvent>((event, emit) {
      emit(state.copyWith(
        residentialCapRateData: {
          'net_operating_income': event.netOperatingIncome,
          'property_value': event.propertyValue,
        },
      ));
    });

    on<UpdateCommercialCapRateEvent>((event, emit) {
      emit(state.copyWith(
        commercialCapRateData: {
          'net_operating_income': event.netOperatingIncome,
          'property_value': event.propertyValue,
        },
      ));
    });

    on<UpdateCashOnCashReturnEvent>((event, emit) {
      emit(state.copyWith(
        cashOnCashReturnData: {
          'annual_cash_flow': event.annualCashFlow,
          'cash_invested': event.cashInvested,
        },
      ));
    });

    on<UpdateInternalRateOfReturnEvent>((event, emit) {
      emit(state.copyWith(
        internalRateOfReturnData: {
          'cash_flows': event.cashFlows,
        },
      ));
    });

    on<UpdateVacancyRateEvent>((event, emit) {
      emit(state.copyWith(
        vacancyRateData: {
          'vacant_units': event.vacantUnits,
          'total_units': event.totalUnits,
        },
      ));
    });

    on<UpdateOperatingExpenseRatioEvent>((event, emit) {
      emit(state.copyWith(
        operatingExpenseRatioData: {
          'operating_expenses': event.operatingExpenses,
          'net_operating_income': event.netOperatingIncome,
        },
      ));
    });
  }























  }

