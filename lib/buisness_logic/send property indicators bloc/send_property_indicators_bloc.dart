import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/buisness_logic/create%20property%20indicator%20bloc/create_property_indicators_bloc.dart';

import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'send_property_indicators_event.dart';
part 'send_property_indicators_state.dart';

class SendPropertyIndicatorsBloc
    extends Bloc<SendPropertyIndicatorsEvent, SendPropertyIndicatorsState> {
  final RequsetsRepoImpl requsetsRepoImpl;
  SendPropertyIndicatorsBloc(this.requsetsRepoImpl)
    : super(SendPropertyIndicatorsInitial()) {
    on<SendPropertyApiIndicatorsEvent>((event, emit) async {
      emit(SendPropertyIndicatorsLoading());
      final response = await requsetsRepoImpl.sendPrpertyIndicators(event);
      emit(SendPropertyIndicatorsStatus(helperResponse: response));
    });
  }
}
