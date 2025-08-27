import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:economic_team_desktop/buisness_logic/chat%20users%20bloc/chat_users_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/data/models/message.dart';
import 'package:economic_team_desktop/data/services/chat%20services/chat_services.dart';
import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/customer_info_section.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/expert_message.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/input_chat_field.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/negotiation_offer_box.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/user_message.dart';
import 'package:economic_team_desktop/utility/elevated_button_widget.dart';
import 'package:economic_team_desktop/utility/service_locator.dart';
import 'package:economic_team_desktop/utility/somthing_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NegotaitionView extends StatefulWidget {
  const NegotaitionView({
    super.key,
    required this.otherUSerId,
    required this.onBack,
    this.chatRoomId,
  });
  final String otherUSerId;
  final VoidCallback onBack;
  final chatRoomId;
  @override
  State<NegotaitionView> createState() => _NegotiationViewState();
}

class _NegotiationViewState extends State<NegotaitionView> {
  bool _noInternet = false;
  final chatService = getIt.get<ChatService>();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  StreamSubscription<Message>? _messageSubscription;
  bool _showNegotiationBox = false;
  String? _currentChatRoomId;
  final String _currentUserId = userId!;

  bool _isSocketConnected = false;
  DateTime? _lastMessageTimestamp;
  bool _isLoadingMore = false;
  bool _hasMoreMessages = true;
  List<Message> _messages = [];

  @override
  void initState() {
    print("doooooo ${widget.otherUSerId} + ${widget.chatRoomId}");
    print(widget.chatRoomId);
    super.initState();
    _initializeChat();
    _messageSubscription = chatService.onNewMessage.listen((msg) {
      if (msg.chatRoomId == _currentChatRoomId &&
          msg.senderId != _currentUserId &&
          !_messages.any((m) => m.id == msg.id)) {
        setState(() {
          _messages.add(msg);
        });
        _scrollToBottom();
      }
    });
  }

  Future<void> _initializeChat() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _noInternet = true;
      });
      return;
    }

    try {
      _currentChatRoomId = await chatService.createChatRoom(
        _currentUserId,
        widget.otherUSerId,
      );
      if (_currentChatRoomId != null) {
        chatService.joinChatRoom(_currentChatRoomId!);
        setState(() {
          _isSocketConnected = chatService.socket.connected;
        });

        await _loadMoreMessages();
        _jumpToBottom();
      }
    } catch (e) {
      setState(() {
        _noInternet = true;
      });
    }
  }

  Future<void> _loadMoreMessages() async {
    if (_isLoadingMore || !_hasMoreMessages || _currentChatRoomId == null)
      return;

    setState(() => _isLoadingMore = true);
    try {
      final newMessages = await chatService.getHistoricalMessages(
        _currentChatRoomId!,
        lastMessageTimestamp: _lastMessageTimestamp,
        limit: 20,
      );
      print("the limit  the timeStamp ${_lastMessageTimestamp}  ");

      if (newMessages.isEmpty) {
        setState(() => _hasMoreMessages = false);
      } else {
        newMessages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        setState(() {
          _messages.insertAll(0, newMessages);
          _lastMessageTimestamp = newMessages.first.timestamp;
        });
      }
      print("Message count: ${_messages.length}");
      print("New lastMessageTimestamp: $_lastMessageTimestamp");
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading more messages: $e')),
        );
      }
    } finally {
      setState(() => _isLoadingMore = false);
    }
  }

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty || _currentChatRoomId == null) return;
    final tempId = UniqueKey().toString();
    final now = DateTime.now();
    final localMsg = Message(
      isExpert: true,
      id: tempId,
      chatRoomId: _currentChatRoomId!,
      senderId: _currentUserId,
      text: text,
      timestamp: now,
    );
    print(now);
    setState(() {
      _messages.add(localMsg);
    });
    _scrollToBottom();

    try {
      await chatService.sendMessage(
        chatRoomId: _currentChatRoomId!,
        senderId: _currentUserId,
        text: text,
      );
      print('sender and  ${_currentChatRoomId! + _currentUserId}');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error sending message: $e')));
      }
    } finally {
      _messageController.clear();
    }
  }

  void _scrollToBottom() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _jumpToBottom() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  Widget _buildMessageWidget(Message message) {
    final isMe = message.senderId == _currentUserId;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child:
            isMe
                ? UserMessage(text: message.text)
                : ExpertMessage(text: message.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_noInternet) {
      return SomethingWrongWidget(
        elevatedButtonWidget: ElevatedButtonWidget(
          title: "Refresh",
          onPressed: () {
            setState(() => _noInternet = false);
            _initializeChat();
          },
        ),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeHeader(
              onPress: () {
                context.read<ChatUsersBloc>().add(
                  GetChatUsersEvent(userId: userId!),
                );
                widget.onBack();
              },
              title: 'Negotiation',
            ),
          ),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 30.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        Expanded(
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (scrollInfo) {
                              if (scrollInfo is ScrollEndNotification &&
                                  scrollInfo.metrics.pixels ==
                                      scrollInfo.metrics.minScrollExtent &&
                                  !_isLoadingMore &&
                                  _hasMoreMessages) {
                                _loadMoreMessages();
                              }
                              return false;
                            },
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount:
                                  _messages.length + (_isLoadingMore ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index == _messages.length) {
                                  return const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                                return _buildMessageWidget(_messages[index]);
                              },
                            ),
                          ),
                        ),
                        if (_showNegotiationBox)
                          Padding(
                            padding: EdgeInsets.only(right: 8.0.w),
                            child: NegotiationOfferBox(propertyId: ''),
                          ),
                        Row(
                          children: [
                            InkWell(
                              onTap:
                                  () => setState(
                                    () =>
                                        _showNegotiationBox =
                                            !_showNegotiationBox,
                                  ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 14.0.w),
                                child: Assets.images.saveIcon.image(
                                  width: 32.w,
                                  height: 32.h,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(12.0.sp),
                                child: InputChatField(
                                  controller: _messageController,
                                  onSubmitted: _sendMessage,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomerInfoSection(userId: widget.otherUSerId),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (_currentChatRoomId != null) {
      chatService.leaveChatRoom(_currentChatRoomId!);
    }
    _messageSubscription?.cancel();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
