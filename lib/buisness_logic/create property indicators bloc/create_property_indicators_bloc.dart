import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:economic_team_desktop/data/models/request_details_response/indicator_value.dart';
import 'package:economic_team_desktop/data/models/test/indicator_state/indicator.dart';

import 'package:meta/meta.dart';

part 'create_property_indicators_event.dart';
part 'create_property_indicators_state.dart';

class CreatePropertyIndicatorsBloc extends Bloc<CreatePropertyIndicatorsEvent, CreatePropertyIndicatorsState> {
  CreatePropertyIndicatorsBloc() : super(CreatePropertyIndicatorsInitial()) {
    on<AddIndicatorEvent>((event, emit) {
      emit(state.copyWith(indicators: event.indicators.indicators));
    });
  }
}
