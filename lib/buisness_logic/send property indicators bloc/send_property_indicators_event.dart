part of 'send_property_indicators_bloc.dart';

@immutable
sealed class SendPropertyIndicatorsEvent {}

class SendPropertyApiIndicatorsEvent extends SendPropertyIndicatorsEvent {
  final CreatePropertyIndicatorsState createPropertyIndicatorsState;
  final String id;
  SendPropertyApiIndicatorsEvent({
    required this.createPropertyIndicatorsState,
    required this.id,
  });
}
