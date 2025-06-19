import 'package:economic_team_desktop/buisness_logic/chat%20users%20bloc/chat_users_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/chat_buuton.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/user_list_item.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/user_list_item_shimmer.dart';
import 'package:economic_team_desktop/utility/elevated_button_widget.dart';
import 'package:economic_team_desktop/utility/somthing_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NegotiationUsersList extends StatelessWidget {
  const NegotiationUsersList({super.key, required this.onUserSelected});
  final void Function(String userName) onUserSelected;
  @override
  Widget build(BuildContext context) {
    void refresh() {
      context.read<ChatUsersBloc>().add(GetChatUsersEvent(userId: userId!));
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: HomeHeader(title: 'Requests'),
        ),
        SizedBox(height: 20.h),
        CustomDivider(),

        Expanded(
          child: BlocBuilder<ChatUsersBloc, ChatUsersState>(
            builder: (context, state) {
              if (state is ChatUsersLoading || state is ChatUsersInitial) {
                return ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: UserListItemShimmer(),
                    );
                  },
                );
              }
              if (state is ChatUsersSuccess && state.chatUsers.chats!.isEmpty) {
                return Expanded(
                  child: SomethingWrongWidget(
                    title: "No Questions found !",
                    //   svgPath: 'assets/images/search.svg',
                    elevatedButtonWidget: ElevatedButtonWidget(
                      title: "Refresh",
                      onPressed: () {
                        refresh();
                        // context.read<PropertyRequestsBloc>().add(
                        //   GetPropertiesRequestEvent(),
                        // );
                      },
                    ),
                  ),
                );
              }
              if (state is ChatUsersSuccess) {
                return RefreshIndicator(
                  onRefresh: () async {
                    refresh();
                  },
                  child: ListView.builder(
                    itemCount: state.chatUsers.chats!.length,
                    itemBuilder: (context, index) {
                      final userItem = state.chatUsers.chats![index];
                      print(
                        userItem.lastMessage != null &&
                                userItem.lastMessage!.senderId != null
                            ? userItem.lastMessage!.senderId!
                            : " ",
                      );
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: UserListItem(
                          senderId:
                              userItem.lastMessage != null &&
                                      userItem.lastMessage!.senderId != null
                                  ? userItem.lastMessage!.senderId!
                                  : " ",
                          chatRoomID: userItem.chatRoomId!,
                          read:
                              userItem.lastMessage != null
                                  ? userItem.lastMessage!.read!
                                  : "unread",
                          lastMessageTime: DateTime.tryParse(
                            userItem.createdAt!,
                          ),
                          lastMessage:
                              userItem.lastMessage != null
                                  ? userItem.lastMessage!.text
                                  : " ",
                          //   lastMessageTime: userItem.createdAt.toString(),
                          //  DateTime.now().subtract(
                          //   Duration(minutes: 30),
                          // ),
                          onUserSelected: onUserSelected,
                          userID:
                              userItem.otherUser != null
                                  ? userItem.otherUser!.id!
                                  : '',
                          userName:
                              userItem.otherUser != null
                                  ? userItem.otherUser!.name!
                                  : 'ali ali',
                        ),
                      );
                    },
                  ),
                );
              } else if (state is ChatUsersFailure) {
                return SomethingWrongWidget(
                  elevatedButtonWidget: ElevatedButtonWidget(
                    title: "Refresh",
                    onPressed: () {
                      refresh();
                    },
                  ),
                );
              }
              return SomethingWrongWidget(
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh",
                  onPressed: () {
                    refresh();
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
