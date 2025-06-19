part of 'negotiation_bloc_bloc.dart';

@immutable
//sealed class NegotiationBlocState {}

final class NegotiationBlocInitial extends NegotiationBlocState {}
class NegotiationBlocState {
  final List<Message> messages;
  final bool isLoadingMore;
  final bool hasMoreMessages;
  final bool showNegotiationBox;
  final String? currentChatRoomId;
  final bool isSocketConnected;
  final DateTime? lastMessageTimestamp;

  NegotiationBlocState({
    this.messages = const [],
    this.isLoadingMore = false,
    this.hasMoreMessages = true,
    this.showNegotiationBox = false,
    this.currentChatRoomId,
    this.isSocketConnected = false,
    this.lastMessageTimestamp,
  });

  NegotiationBlocState copyWith({
    List<Message>? messages,
    bool? isLoadingMore,
    bool? hasMoreMessages,
    bool? showNegotiationBox,
    String? currentChatRoomId,
    bool? isSocketConnected,
    DateTime? lastMessageTimestamp,
  }) {
    return NegotiationBlocState(
      messages: messages ?? this.messages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMoreMessages: hasMoreMessages ?? this.hasMoreMessages,
      showNegotiationBox: showNegotiationBox ?? this.showNegotiationBox,
      currentChatRoomId: currentChatRoomId ?? this.currentChatRoomId,
      isSocketConnected: isSocketConnected ?? this.isSocketConnected,
      lastMessageTimestamp: lastMessageTimestamp ?? this.lastMessageTimestamp,
    );
  }
}