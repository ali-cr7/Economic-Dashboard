import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/request_details_response/request_details_response.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'property_request_details_event.dart';
part 'property_request_details_state.dart';

class PropertyRequestDetailsBloc
    extends Bloc<PropertyRequestDetailsEvent, PropertyRequestDetailsState> {
  final RequsetsRepoImpl requsetsRepoImpl;
  PropertyRequestDetailsBloc(this.requsetsRepoImpl)
    : super(PropertyRequestDetailsInitial()) {
    on<GetPropertiesRequestDetailsEvent>((event, emit) async {
      emit(PropertyRequestDetailsLoading());
      final response = await requsetsRepoImpl.getPropertiesRequetsDetails(
        event,
      );
      if (response is RequestDetailsResponse) {
        emit(PropertyRequestDetailsSuccses(requestDetailsResponse: response));
      } else {
        emit(PropertyRequestDetailsFailure(helperResponse: response));
      }
    });
  }
}
