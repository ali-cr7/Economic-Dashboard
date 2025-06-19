import 'package:economic_team_desktop/buisness_logic/currency%20bloc/currency_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/requests%20statistcs%20bloc/requstes_statistics_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/statistics%20chart%20bloc/staitstics_chart_bloc.dart';

abstract class StatisticsRepo {
  Future getCurrency(GetCurrencyEvent event);
  Future getRequestsStatistics(GetRequstesStatisticsEvent event);
  Future getStatisticsChart(GetStaitsticsChartEvent event);
}
