part of 'negotiation_bloc_bloc.dart';

@immutable
sealed class NegotiationBlocEvent {}

class LoadMoreMessages extends NegotiationBlocEvent {}

class SendMessage extends NegotiationBlocEvent {
  final String text;
  SendMessage(this.text);
}

class NewMessageReceived extends NegotiationBlocEvent {
  final Message message;
  NewMessageReceived(this.message);
}

class ToggleNegotiationBox extends NegotiationBlocEvent {}
