part of 'chat_users_bloc.dart';

@immutable
sealed class ChatUsersEvent {}

class GetChatUsersEvent extends ChatUsersEvent {
  final String userId;

  GetChatUsersEvent({required this.userId});
}

class MarkLastMessageAsReadEvent extends ChatUsersEvent {
  final String userId;
  final String chatRoomId;

  MarkLastMessageAsReadEvent({required this.userId, required this.chatRoomId});
}
