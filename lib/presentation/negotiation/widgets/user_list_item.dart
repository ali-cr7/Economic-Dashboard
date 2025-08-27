import 'package:economic_team_desktop/buisness_logic/chat%20users%20bloc/chat_users_bloc.dart';
import 'package:economic_team_desktop/constants.dart';
import 'package:economic_team_desktop/presentation/negotiation/widgets/chat_buuton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.userName,
    required this.userID,
    required this.onUserSelected,
    this.lastMessage,
    this.lastMessageTime,
    required this.read,
    required this.chatRoomID,
    required this.senderId,
  });

  final String userName;
  final String userID;
  final void Function(String userName) onUserSelected;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final String read;
  final String chatRoomID;
  final String senderId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800.w,
      height: 95.h,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, 1.00),
          end: Alignment(1.00, 0.12),
          colors: [
            const Color(0xFFD5CFF5),
            const Color(0xB2A9A4C2),
            const Color(0xB2928EA8),
            const Color(0xB27C798F),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2.w, color: const Color(0xFF836BFD)),
          borderRadius: BorderRadius.circular(20.sp),
        ),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 16.w),
            // Avatar
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundColor: const Color(0xB27C798F),
                  child: Text(
                    getInitials(userName),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                if (read == 'unread' && senderId != userId)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(width: 16.w),

            // User Info and Last Message
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Last Message
                  if (lastMessage != null) ...[
                    Text(
                      lastMessage!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                    ),
                    SizedBox(height: 2.h),
                    // Last Message Time
                    if (lastMessageTime != null)
                      Text(
                        _formatTime(lastMessageTime!),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black45,
                        ),
                      ),
                  ],
                ],
              ),
            ),

            // Chat Button
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: ChatButton(
                onPressed: () {
                  onUserSelected(userID);
                  context.read<ChatUsersBloc>().add(
                    MarkLastMessageAsReadEvent(
                      userId: userId!,
                      chatRoomId: chatRoomID,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

String getInitials(String name) {
  List<String> parts = name.trim().split(' ');
  if (parts.length == 1) {
    return parts[0].substring(0, 1).toUpperCase();
  } else {
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }
}
