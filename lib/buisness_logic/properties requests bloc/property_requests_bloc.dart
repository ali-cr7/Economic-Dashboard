import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/get_requests_from_lawyer_response/get_requests_from_lawyer_response.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'property_requests_event.dart';
part 'property_requests_state.dart';

class PropertyRequestsBloc
    extends Bloc<PropertyRequestsEvent, PropertyRequestsState> {
  final RequsetsRepoImpl requsetsRepoImpl;
  PropertyRequestsBloc(this.requsetsRepoImpl)
    : super(PropertyRequestsInitial()) {
    on<GetPropertiesRequestEvent>((event, emit) async {
      emit(PropertyRequestsLoading());
      final response = await requsetsRepoImpl.getPropertiesRequets(event);
      if (response is GetRequestsFromLawyerResponse) {
        emit(PropertyRequestsSuccess(getRequestsFromLawyerResponse: response));
      } else {
        emit(PropertyRequestsFailure(helperResponse: response));
      }
    });
  }
}
