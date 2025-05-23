import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:economic_team_desktop/buisness_logic/create%20economic%20study%20bloc/create_economic_study_bloc.dart';
import 'package:economic_team_desktop/data/services/requests%20srevices/requsets_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'send_economic_study_event.dart';
part 'send_economic_study_state.dart';

class SendEconomicStudyBloc
    extends Bloc<SendEconomicStudyEvent, SendEconomicStudyState> {
  final RequsetsRepoImpl requsetsRepoImpl;
  SendEconomicStudyBloc(this.requsetsRepoImpl) : super(SendEconomicStudyInitial()) {
    on<SendEconomicStudyApiEvent>((event, emit) async {
      emit(SendEconomicStudyLoading());
      final response = await requsetsRepoImpl.sendEconomicStudy(event);
      emit(SendEconomicStudyStatus(helperResponse: response));
    });
       on<EditEconomicStudyApiEvent>((event, emit) async {
      emit(SendEconomicStudyLoading());
      final response = await requsetsRepoImpl.sendEconomicStudy(event);
      emit(SendEconomicStudyStatus(helperResponse: response));
    });
  }
}
