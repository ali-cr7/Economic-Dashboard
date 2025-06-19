part of 'property_indicators_bloc.dart';

@immutable
sealed class PropertyIndicatorsEvent {}
class GetPropertyIndicatorsEvent extends PropertyIndicatorsEvent{
  @override
  List<Object?> get props => [];

}