import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/staistics_chart_response/staistics_chart_response.dart'
    show StaisticsChartResponse;
import 'package:economic_team_desktop/data/services/statistics%20services/statistics_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'staitstics_chart_event.dart';
part 'staitstics_chart_state.dart';

class StaitsticsChartBloc
    extends Bloc<StaitsticsChartEvent, StaitsticsChartState> {
  final StatisticsRepoImpl statisticsRepoImpl;
  StaitsticsChartBloc(this.statisticsRepoImpl)
    : super(StaitsticsChartInitial()) {
    on<GetStaitsticsChartEvent>((event, emit) async {
      emit(StaitsticsChartLoading());
      final response = await statisticsRepoImpl.getStatisticsChart(event);
      if (response is StaisticsChartResponse) {
        emit(StaitsticsChartSuccess(staisticsChartResponse: response));
      } else if (response is HelperResponse) {
        emit(StaitsticsChartFailure(helperResponse: response));
      }
    });
  }
}
