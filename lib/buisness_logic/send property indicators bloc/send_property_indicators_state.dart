part of 'send_property_indicators_bloc.dart';

@immutable
sealed class SendPropertyIndicatorsState {}

final class SendPropertyIndicatorsInitial extends SendPropertyIndicatorsState {}
class SendPropertyIndicatorsLoading extends SendPropertyIndicatorsState {
  @override
  List<Object> get props => [];
}

class SendPropertyIndicatorsStatus extends SendPropertyIndicatorsState {
  SendPropertyIndicatorsStatus({required this.helperResponse});

  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse.servicesResponse,helperResponse.response];
}