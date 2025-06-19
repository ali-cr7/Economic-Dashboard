part of 'property_indicators_bloc.dart';

@immutable
sealed class PropertyIndicatorsState {}

final class PropertyIndicatorsInitial extends PropertyIndicatorsState {}

final class PropertyIndicatorsLoading extends PropertyIndicatorsState {}

final class PropertyIndicatorsSuccess extends PropertyIndicatorsState {
  final GetIndicatorResponse getIndicatorResponse;

  PropertyIndicatorsSuccess({required this.getIndicatorResponse});
}

final class PropertyIndicatorsFailure extends PropertyIndicatorsState {
  final HelperResponse helperResponse;

  PropertyIndicatorsFailure({required this.helperResponse});
}
