import 'dart:convert';

import 'chat.dart';

class ChatUsers {
	List<Chat>? chats;

	ChatUsers({this.chats});

	factory ChatUsers.from(Map<String, dynamic> data) {
		return ChatUsers(
			chats: (data['chats'] as List<dynamic>?)
						?.map((e) => Chat.from(e as Map<String, dynamic>))
						.toList(),
		);
	}

	Map<String, dynamic> to() {
		return {
			'chats': chats?.map((e) => e.to()).toList(),
		};
	}

	/// `dart:convert`
	///
	/// Parses the string and returns the resulting Json object as [ChatUsers].
	factory ChatUsers.fromJson(String data) {
		return ChatUsers.from(json.decode(data) as Map<String, dynamic>);
	}

	/// `dart:convert`
	///
	/// Converts [ChatUsers] to a JSON string.
	String toJson() => json.encode(to());
}
