part of 'requstes_statistics_bloc.dart';

@immutable
sealed class RequstesStatisticsState {}

final class RequstesStatisticsInitial extends RequstesStatisticsState {}

final class RequstesStatisticsLoading extends RequstesStatisticsState {}

final class RequstesStatisticsFailure extends RequstesStatisticsState {
  final HelperResponse helperResponse;

  RequstesStatisticsFailure({required this.helperResponse});
}

final class RequstesStatisticsSuccess extends RequstesStatisticsState {
  final RequestsStatisticsResponse requestsStatisticsResponse;

  RequstesStatisticsSuccess({required this.requestsStatisticsResponse});
}
