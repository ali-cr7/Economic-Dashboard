part of 'negotiation_offer_bloc.dart';

@immutable
sealed class NegotiationOfferEvent {}

class CreateNegotiationOffer extends NegotiationOfferEvent{
  final String offerContent;
  final String propertyId;
  final String payWay;

  CreateNegotiationOffer({required this.offerContent, required this.propertyId, required this.payWay});



  @override
  List<Object?> get props => [offerContent,propertyId,payWay];

}
class EditNegotiationOffer extends NegotiationOfferEvent{
  final String offerContent;
  final String negotiationId;
  final String payWay;

  EditNegotiationOffer({required this.offerContent, required this.negotiationId, required this.payWay});



  @override
  List<Object?> get props => [offerContent,negotiationId,payWay];

}





class GetNegotiationOffer extends NegotiationOfferEvent{

  final String propertyId;


  GetNegotiationOffer({ required this.propertyId,});



  @override
  List<Object?> get props => [propertyId];

}