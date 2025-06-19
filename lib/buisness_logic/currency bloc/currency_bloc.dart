import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/currency_response/currency_response.dart';
import 'package:economic_team_desktop/data/services/statistics%20services/statistics_repo_impl.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final StatisticsRepoImpl statisticsRepoImpl;
  CurrencyBloc(this.statisticsRepoImpl) : super(CurrencyInitial()) {
    on<GetCurrencyEvent>((event, emit) async {
      emit(CurrencyLoading());
      final response = await statisticsRepoImpl.getCurrency(event);
      if (response is CurrencyResponse) {
        emit(CurrencySuccess(currencyResponse: response));
      } else {
        emit(CurrencyFailure(errMessage: "there is no data try again"));
      }
    });
  }
}
