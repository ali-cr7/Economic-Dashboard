import 'package:bloc/bloc.dart';
import 'package:economic_team_desktop/data/models/chat_users/chat_users.dart';
import 'package:economic_team_desktop/data/services/chat%20services/chat_services.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:meta/meta.dart';

part 'chat_users_event.dart';
part 'chat_users_state.dart';

class ChatUsersBloc extends Bloc<ChatUsersEvent, ChatUsersState> {
  final ChatService chatService;
  ChatUsersBloc(this.chatService) : super(ChatUsersInitial()) {
    on<GetChatUsersEvent>((event, emit) async {
      emit(ChatUsersLoading());
      final response = await chatService.getUserChats(event);

      if (response is ChatUsers) {
        emit(ChatUsersSuccess(chatUsers: response));
      } else {
        emit(ChatUsersFailure(helperResponse: response));
      }
    });

    on<MarkLastMessageAsReadEvent>((event, emit) async {
      final response = await chatService.markLastMessageAsRead(event);

      if (response == 'true') {
        add(
          GetChatUsersEvent(userId: event.userId),
        ); // Pass any required parameters
      } else {
        emit(ChatUsersFailure(helperResponse: response));
      }
    });
  }
}
