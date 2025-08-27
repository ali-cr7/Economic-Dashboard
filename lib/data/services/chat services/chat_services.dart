import 'package:dio/dio.dart';
import 'package:economic_team_desktop/buisness_logic/chat%20users%20bloc/chat_users_bloc.dart';
import 'package:economic_team_desktop/data/models/chat_users/chat_users.dart';
import 'package:economic_team_desktop/enums.dart';
import 'package:economic_team_desktop/utility/api_config/api_config.dart';
import 'package:economic_team_desktop/utility/api_config/api_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:economic_team_desktop/data/models/message.dart';
import 'dart:async'; // Import dart:async for StreamController


import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:economic_team_desktop/data/models/message.dart';
import 'dart:async';

class ChatService {
  final ApiService _apiService;
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  final String baseUrl = 'http://localhost:3000';

  late IO.Socket _socket;
  late bool _isConnected;

  // StreamController for real-time messages received from the server
  final StreamController<Message> _realtimeMessageController =
      StreamController<Message>.broadcast();

  // Expose the real-time messages stream
  Stream<Message> get onNewMessage => _realtimeMessageController.stream;

  // Counter for received messages
  int _receiveMessageTriggerCount = 0;

  ChatService(this._apiService) {
    _socket = _initializeSocket();
  }

  IO.Socket get socket => _socket;

  void joinChatRoom(String chatRoomId) {
    print('[ChatService] Joining chat room: $chatRoomId');
    socket.emit('join_room', chatRoomId);
  }

  void leaveChatRoom(String chatRoomId) {
    print('[ChatService] Leaving chat room: $chatRoomId');
    socket.emit('leave_room', chatRoomId);
  }

  Future<String> createChatRoom(
    String currentUserId,
    String otherUserId,
  ) async {
    try {
      final response = await _dio.post(
        '/chat/room',
        data: {'currentUserId': currentUserId, 'otherUserId': otherUserId},
      );

      if (response.statusCode == 200) {
        final roomId = response.data['roomId'];
        joinChatRoom(roomId);
        return roomId;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to create chat room',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e, 'Error creating chat room');
    } catch (e) {
      throw Exception('Unexpected error creating chat room: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getChatRooms(String userId) async {
    try {
      final response = await _dio.get('/chat/rooms/$userId');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.cast<Map<String, dynamic>>();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to get chat rooms',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e, 'Error getting chat rooms');
    } catch (e) {
      throw Exception('Unexpected error getting chat rooms: $e');
    }
  }

  Future<void> sendMessage({
    required String chatRoomId,
    required String senderId,
    required String text,
  }) async {
    try {
      // Send the message via HTTP to save it
      final response = await _dio.post(
        '/chat/message',
        data: {'chatRoomId': chatRoomId, 'senderId': senderId, 'text': text},
      );

      if (response.statusCode == 201) {
        // Optionally, emit via socket if needed
        print(
          '[ChatService] Message sent via HTTP: $text to room: $chatRoomId',
        );
        // socket.emit('send_message', {
        //   'chatRoomId': chatRoomId,
        //   'senderId': senderId,
        //   'text': text,
        // });
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to send message',
        );
      }
    } catch (e) {
      print('[ChatService] Error sending message: $e');
      throw Exception('Failed to send message: $e');
    }
  }

  Future<List<Message>> getHistoricalMessages(
    String chatRoomId, {
    DateTime? lastMessageTimestamp,
    int limit = 20,
  }) async {
    try {
      final response = await _dio.get(
        '/chat/messages/$chatRoomId',
        queryParameters: {
          'limit': limit.toString(),
          if (lastMessageTimestamp != null)
            'lastMessageTimestamp': lastMessageTimestamp.toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> messagesData = data['messages'];
        return messagesData.map((m) => Message.fromJson(m)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to get historical messages',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e, 'Error getting historical messages');
    } catch (e) {
      throw Exception('Unexpected error fetching historical messages: $e');
    }
  }

  Future getUserChats(GetChatUsersEvent event) async {
    print(APIConfig.getChatEndpoint('user/${event.userId}/chats'));
    HelperResponse helperResponse = await _apiService.get(
      endpoint: APIConfig.getChatEndpoint('user/${event.userId}/chats'),
    );
    print(helperResponse.fullBody);

    print("full requests response${helperResponse.fullBody}");
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        ChatUsers chatUsers = ChatUsers.from(helperResponse.fullBody!);
        return chatUsers;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  Future markLastMessageAsRead(MarkLastMessageAsReadEvent event) async {
    HelperResponse helperResponse = await _apiService.patch(
      endpoint: APIConfig.getChatEndpoint(
        'chat/rooms/${event.chatRoomId}/last-message/read',
      ),
      data: {'userId': event.userId},
    );
    print('the patch body ${event.userId}  ${event.chatRoomId}');
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      try {
        String updated = helperResponse.fullBody!['updated'];
        // ChatUsers.from(helperResponse.fullBody!);
        return updated;
      } catch (e) {
        return helperResponse.copyWith(
          servicesResponse: ServicesResponseStatues.modelError,
        );
      }
    }
  }

  Future<List<Map<String, dynamic>>> getAllUsersExceptCurrent(
    String currentUserId,
  ) async {
    try {
      final response = await _dio.get('/users/except/$currentUserId');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.cast<Map<String, dynamic>>();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to get users',
        );
      }
    } on DioException catch (e) {
      throw _handleError(e, 'Error getting users');
    } catch (e) {
      throw Exception('Unexpected error getting users: $e');
    }
  }

  Exception _handleError(DioException e, String message) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return Exception(
        'Connection timeout. Please check your internet connection.',
      );
    } else if (e.type == DioExceptionType.badResponse) {
      return Exception('${e.response?.data['error'] ?? message}');
    } else {
      return Exception('$message: ${e.message}');
    }
  }

  IO.Socket _initializeSocket() {
    print('[ChatService] Initializing Socket.IO connection...');

    final socket = IO.io(baseUrl, <String, dynamic>{
      'transports': ['websocket', 'polling'],
      'autoConnect': true,
      'reconnection': true,
      'reconnectionAttempts': 5,
      'reconnectionDelay': 1000,
      'path': '/socket.io/',
      'forceNew': true,
      'timeout': 10000,
    });

    socket.onConnect((_) {
      print('[ChatService] Socket.IO Connected successfully');
      _isConnected = true;
    });

    socket.onDisconnect((_) {
      print('[ChatService] Socket.IO Disconnected');
      _isConnected = false;
    });

    socket.onConnectError((error) {
      print('[ChatService] Socket.IO Connection Error: $error');
      _isConnected = false;
    });

    socket.onError((error) {
      print('[ChatService] Socket.IO Error: $error');
      _isConnected = false;
    });

    socket.onReconnect((_) {
      print('[ChatService] Socket.IO Reconnected');
      _isConnected = true;
    });

    socket.onReconnectAttempt((attemptNumber) {
      print('[ChatService] Socket.IO Reconnection attempt: $attemptNumber');
    });

    // Clear previous listeners (if any) before adding new
    socket.off('receive_message');
    socket.on('receive_message', (data) {
      _receiveMessageTriggerCount++;
      print('[ChatService] Received message via socket: $data');
      print(
        '[ChatService] receive_message trigger count: $_receiveMessageTriggerCount',
      );
      try {
        final message = Message.fromJson(data);
        _realtimeMessageController.sink.add(message);
      } catch (e) {
        print('[ChatService] Error parsing received message: $e');
      }
    });

    return socket;
  }

  void dispose() {
    _socket.dispose();
    _realtimeMessageController.close();
  }
}

