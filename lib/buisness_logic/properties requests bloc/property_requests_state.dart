part of 'property_requests_bloc.dart';

@immutable
sealed class PropertyRequestsState {}

final class PropertyRequestsInitial extends PropertyRequestsState {}

final class PropertyRequestsLoading extends PropertyRequestsState {}

final class PropertyRequestsFailure extends PropertyRequestsState {
  final HelperResponse helperResponse;

  PropertyRequestsFailure({required this.helperResponse});
}

final class PropertyRequestsSuccess extends PropertyRequestsState {
  final GetRequestsFromLawyerResponse getRequestsFromLawyerResponse;

  PropertyRequestsSuccess({required this.getRequestsFromLawyerResponse});
}
