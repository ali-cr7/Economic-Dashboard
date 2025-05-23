part of 'property_request_details_bloc.dart';

@immutable
sealed class PropertyRequestDetailsState {}

final class PropertyRequestDetailsInitial extends PropertyRequestDetailsState {}

final class PropertyRequestDetailsLoading extends PropertyRequestDetailsState {}

final class PropertyRequestDetailsSuccses extends PropertyRequestDetailsState {
  final RequestDetailsResponse requestDetailsResponse;

  PropertyRequestDetailsSuccses({required this.requestDetailsResponse});
}

final class PropertyRequestDetailsFailure extends PropertyRequestDetailsState {
  final HelperResponse helperResponse;

  PropertyRequestDetailsFailure({required this.helperResponse});
}
