import 'package:economic_team_desktop/buisness_logic/currency%20bloc/currency_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/requests%20statistcs%20bloc/requstes_statistics_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/statistics%20chart%20bloc/staitstics_chart_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/data/models/currency_response/currency_response.dart';
import 'package:economic_team_desktop/data/models/requests_statistics_response.dart';
import 'package:economic_team_desktop/data/models/staistics_chart_response/staistics_chart_response.dart';
import 'package:economic_team_desktop/data/services/statistics%20services/statistics_repo.dart';
import 'package:economic_team_desktop/enums.dart';
import 'package:economic_team_desktop/utility/api_config/api_config.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';

class StatisticsRepoImpl implements StatisticsRepo {
  final ApiService _apiService;

  StatisticsRepoImpl(this._apiService);
  @override
  Future getCurrency(GetCurrencyEvent event) async {
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.currencyEndPoint,
    );
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        CurrencyResponse currencyResponse = CurrencyResponse.from(
          helperResponse.fullBody!,
        );
        return currencyResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  @override
  Future getRequestsStatistics(GetRequstesStatisticsEvent event) async {
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.getRequestStatistics,
      data: {'year': event.year},
      token: token,
    );
    print(" message state${helperResponse.servicesResponse}");
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        RequestsStatisticsResponse requestsStatisticsResponse =
            RequestsStatisticsResponse.from(helperResponse.fullBody!);
        print(" message state${requestsStatisticsResponse.message}");
        return requestsStatisticsResponse;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }

    return helperResponse;
  }

  @override
  Future getStatisticsChart(GetStaitsticsChartEvent event)  async{
    HelperResponse helperResponse = await _apiService.post(
      endpoint: APIConfig.successfulRequestsPercentageByMonthInYear,
      data: {'year': event.year},
      token: token,
    );
   if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        StaisticsChartResponse staisticsChartResponse =
            StaisticsChartResponse.from(helperResponse.fullBody!);
        print(" message state${staisticsChartResponse.message}");
        return staisticsChartResponse;
      } catch (e) { 
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
    return helperResponse;
  }
}
