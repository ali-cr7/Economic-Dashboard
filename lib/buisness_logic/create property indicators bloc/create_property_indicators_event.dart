part of 'create_property_indicators_bloc.dart';

@immutable
sealed class CreatePropertyIndicatorsEvent {}
class AddIndicatorEvent extends CreatePropertyIndicatorsEvent {
  final CreatePropertyIndicatorsState indicators;

  AddIndicatorEvent({required this.indicators});
}