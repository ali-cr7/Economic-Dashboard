part of 'chat_users_bloc.dart';

@immutable
sealed class ChatUsersState {}

final class ChatUsersInitial extends ChatUsersState {}

final class ChatUsersLoading extends ChatUsersState {}

final class ChatUsersFailure extends ChatUsersState {
  final HelperResponse helperResponse;

  ChatUsersFailure({required this.helperResponse});
}

final class ChatUsersSuccess extends ChatUsersState {
  final ChatUsers chatUsers;

  ChatUsersSuccess({required this.chatUsers});
}
