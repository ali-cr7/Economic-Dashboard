part of 'property_request_details_bloc.dart';

@immutable
sealed class PropertyRequestDetailsEvent {}

class GetPropertiesRequestDetailsEvent extends PropertyRequestDetailsEvent {
  final String requestId;

  GetPropertiesRequestDetailsEvent({required this.requestId});
  @override
  List<Object?> get props => [requestId];
}
