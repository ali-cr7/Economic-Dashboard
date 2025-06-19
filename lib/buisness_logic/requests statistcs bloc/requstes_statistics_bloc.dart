import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:economic_team_desktop/data/models/requests_statistics_response.dart';
import 'package:economic_team_desktop/data/services/statistics%20services/statistics_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'requstes_statistics_event.dart';
part 'requstes_statistics_state.dart';

class RequstesStatisticsBloc
    extends Bloc<RequstesStatisticsEvent, RequstesStatisticsState> {
  final StatisticsRepoImpl statisticsRepoImpl;
  RequstesStatisticsBloc(this.statisticsRepoImpl)
    : super(RequstesStatisticsInitial()) {
    on<GetRequstesStatisticsEvent>((event, emit) async {
      emit(RequstesStatisticsLoading());
      final response = await statisticsRepoImpl.getRequestsStatistics(event);
      if (response is RequestsStatisticsResponse) {
        print("successs statists ");
        emit(RequstesStatisticsSuccess(requestsStatisticsResponse: response));
      } else {
        print("failed statists ");
        emit(RequstesStatisticsFailure(helperResponse: response));
      }
    });
  }
}
