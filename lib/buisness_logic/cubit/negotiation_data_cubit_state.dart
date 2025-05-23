part of 'negotiation_data_cubit_cubit.dart';

@immutable
sealed class NegotiationDataCubitState {}

final class NegotiationDataCubitInitial extends NegotiationDataCubitState {}

final class NegotiationDataCubitLoaded extends NegotiationDataCubitState {
  final Map<int, NegotiationDataStatus> negotiationMap;

  NegotiationDataCubitLoaded(this.negotiationMap);
}

@immutable
sealed class NegotiationDataStatus {}

final class NegotiationLoading extends NegotiationDataStatus {}


final class NegotiationSuccess extends NegotiationDataStatus {
  final GerAgreedNegotiatonResponse response;

  NegotiationSuccess(this.response);
}
final class NegotiationNotFound extends NegotiationDataStatus {}

final class NegotiationFailure extends NegotiationDataStatus {
  final HelperResponse error;

  NegotiationFailure(this.error);
}