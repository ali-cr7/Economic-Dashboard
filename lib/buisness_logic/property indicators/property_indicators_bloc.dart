import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/get_indicator_response/get_indicator_response.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'property_indicators_event.dart';
part 'property_indicators_state.dart';

class PropertyIndicatorsBloc
    extends Bloc<PropertyIndicatorsEvent, PropertyIndicatorsState> {
  final RequsetsRepoImpl requsetsRepoImpl;
  PropertyIndicatorsBloc(this.requsetsRepoImpl)
    : super(PropertyIndicatorsInitial()) {
    on<GetPropertyIndicatorsEvent>((event, emit) async {
      emit(PropertyIndicatorsLoading());
      final response = await requsetsRepoImpl.getPropertyIndicator(event);
      if (response is GetIndicatorResponse) {
        emit(PropertyIndicatorsSuccess(getIndicatorResponse: response));
      } else {
        emit(PropertyIndicatorsFailure(helperResponse: response));
      }
    });
  }
}
