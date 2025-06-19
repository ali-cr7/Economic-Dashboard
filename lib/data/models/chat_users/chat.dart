import 'dart:convert';

import 'other_user.dart';
import 'last_message.dart';

class Chat {
	String? chatRoomId;
	OtherUser? otherUser;
	LastMessage? lastMessage;
	String? createdAt;

	Chat({this.chatRoomId, this.otherUser, this.lastMessage, this.createdAt});

	factory Chat.from(Map<String, dynamic> data) {
		return Chat(
			chatRoomId: data['chatRoomId'] as String?,
			otherUser: data['otherUser'] == null
						? null
						: OtherUser.from(data['otherUser'] as Map<String, dynamic>),
			lastMessage: data['lastMessage'] == null
						? null
						: LastMessage.from(data['lastMessage'] as Map<String, dynamic>),
			createdAt: data['createdAt'] as String?,
		);
	}

	Map<String, dynamic> to() {
		return {
			'chatRoomId': chatRoomId,
			'otherUser': otherUser?.to(),
			'lastMessage': lastMessage?.to(),
			'createdAt': createdAt,
		};
	}

	/// `dart:convert`
	///
	/// Parses the string and returns the resulting Json object as [Chat].
	factory Chat.fromJson(String data) {
		return Chat.from(json.decode(data) as Map<String, dynamic>);
	}

	/// `dart:convert`
	///
	/// Converts [Chat] to a JSON string.
	String toJson() => json.encode(to());
}
