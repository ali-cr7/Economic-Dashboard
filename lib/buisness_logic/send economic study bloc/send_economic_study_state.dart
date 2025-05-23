part of 'send_economic_study_bloc.dart';

@immutable
sealed class SendEconomicStudyState {}

final class SendEconomicStudyInitial extends SendEconomicStudyState {}
class SendEconomicStudyLoading extends SendEconomicStudyState {
  @override
  List<Object> get props => [];
}

class SendEconomicStudyStatus extends SendEconomicStudyState {
  SendEconomicStudyStatus({required this.helperResponse});

  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}
