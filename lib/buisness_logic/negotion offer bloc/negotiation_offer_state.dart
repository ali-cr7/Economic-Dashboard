part of 'negotiation_offer_bloc.dart';

@immutable
sealed class NegotiationOfferState {}

final class NegotiationOfferInitial extends NegotiationOfferState {}

final class NegotiationOfferSuccess extends NegotiationOfferState {
  final String message;

  NegotiationOfferSuccess({required this.message});
}

final class NegotiationOfferLoading extends NegotiationOfferState {}

final class NegotiationOfferFailure extends NegotiationOfferState {
  final HelperResponse helperResponse;

  NegotiationOfferFailure({required this.helperResponse});
}
