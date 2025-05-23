import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:economic_team_desktop/data/models/ger_agreed_negotiaton_response/ger_agreed_negotiaton_response.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/enums.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'negotiation_data_cubit_state.dart';

class NegotiationDataCubitCubit extends Cubit<NegotiationDataCubitState> {
  final RequsetsRepoImpl requsetsRepoImpl;
  final Map<int, NegotiationDataStatus> _negotiationMap = {};

  NegotiationDataCubitCubit(this.requsetsRepoImpl)
    : super(NegotiationDataCubitLoaded({}));

  Future<void> getNegotiationOffer(int id) async {
    // Check if we already have a successful response for this ID
    if (_negotiationMap[id] is NegotiationSuccess) {
      return;
    }

    // Set loading state for this specific ID
    _negotiationMap[id] = NegotiationLoading();
    emit(NegotiationDataCubitLoaded(Map.from(_negotiationMap)));

    try {
      final response = await requsetsRepoImpl.getNegottionOffer(id);
      if (response is GerAgreedNegotiatonResponse) {
        _negotiationMap[id] = NegotiationSuccess(response);
        emit(NegotiationDataCubitLoaded(Map.from(_negotiationMap)));
      } else if(response) {
        _negotiationMap[id] = NegotiationNotFound();
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        _negotiationMap[id] = NegotiationNotFound();
      } else {
        _negotiationMap[id] = NegotiationFailure(
          HelperResponse(
            response: e.toString(),
            servicesResponse: ServicesResponseStatues.someThingWrong,
            fullBody: null,
          ),
        );
      }
      emit(NegotiationDataCubitLoaded(Map.from(_negotiationMap)));
    }
  }

  // Helper method to get current status for an ID
  NegotiationDataStatus? getStatusForId(int id) {
    return _negotiationMap[id];
  }
}
