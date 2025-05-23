import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'create_economic_study_event.dart';
part 'create_economic_study_state.dart';

class CreateEconomicStudyBloc
    extends Bloc<CreateEconomicStudyEvent, CreateEconomicStudyState> {
  CreateEconomicStudyBloc() : super(CreateEconomicStudyInitial()) {
    on<UpdateNumberOfChancesEvent>((event, emit) {
      emit(state.copyWith(numberOfChances: event.numberOfChances,
      agreedNegotiationId: event.agreedNegotiationId,
      propertyForSaleId: event.propertyForSaleId , 
      requestFromLawyerId: event.requestFromLawyerId
      ));
    });

    on<UpdateExpectedPriceEvent>((event, emit) {
      emit(state.copyWith(expectedPrice: event.expectedPrice));
    });

    on<UpdateProfitPercentEvent>((event, emit) {
      emit(state.copyWith(profitPercent: event.profitPercent));
    });

    on<UpdateTotalExpectedTaxesEvent>((event, emit) {
      emit(state.copyWith(totalExpectedTaxes: event.totalExpectedTaxes));
    });

    on<UpdateBuyingPriceEvent>((event, emit) {
      emit(state.copyWith(buyingPrice: event.buyingPrice));
    });

    on<UpdateRentingPriceEvent>((event, emit) {
      emit(state.copyWith(rentingPrice: event.rentingPrice));
    });

    on<UpdateChancePriceEvent>((event, emit) {
      emit(state.copyWith(chancePrice: event.chancePrice));
    });

    on<UpdateInvestmentTimeEvent>((event, emit) {
      emit(state.copyWith(investmentTime: event.investmentTime));
    });

    on<UpdateIncomingTimeEvent>((event, emit) {
      emit(state.copyWith(incomingTime: event.incomingTime));
    });

    on<UpdateInvestmentModeEvent>((event, emit) {
      emit(state.copyWith(investmentMode: event.investmentMode));
    });

    on<UpdatePropertyManagementEvent>((event, emit) {
      emit(state.copyWith(propertyManagement: event.propertyManagement));
    });

    on<UpdatePropertyForSaleIdEvent>((event, emit) {
      emit(state.copyWith(propertyForSaleId: event.propertyForSaleId));
    });

    on<UpdateAgreedNegotiationIdEvent>((event, emit) {
      emit(state.copyWith(agreedNegotiationId: event.agreedNegotiationId));
    });
     on<UpdaterequestFromLawyerIdIdEvent>((event, emit) {
      emit(state.copyWith(agreedNegotiationId: event.requestFromLawyerId));
    });
  }
}
