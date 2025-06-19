part of 'staitstics_chart_bloc.dart';

@immutable
sealed class StaitsticsChartState {}

final class StaitsticsChartInitial extends StaitsticsChartState {}

final class StaitsticsChartLoading extends StaitsticsChartState {}

final class StaitsticsChartSuccess extends StaitsticsChartState {
  final StaisticsChartResponse staisticsChartResponse;

  StaitsticsChartSuccess({required this.staisticsChartResponse});
}

final class StaitsticsChartFailure extends StaitsticsChartState {
  final HelperResponse helperResponse;

  StaitsticsChartFailure({required this.helperResponse});
}
