import 'dart:convert';

import 'created_at.dart';
import 'last_seen.dart';

class OtherUser {
	String? id;
	String? name;
	bool? isOnline;
	String? email;
	CreatedAt? createdAt;
	LastSeen? lastSeen;

	OtherUser({
		this.id, 
		this.name, 
		this.isOnline, 
		this.email, 
		this.createdAt, 
		this.lastSeen, 
	});

	factory OtherUser.from(Map<String, dynamic> data) {
		return OtherUser(
			id: data['id'] as String?,
			name: data['name'] as String?,
			isOnline: data['isOnline'] as bool?,
			email: data['email'] as String?,
			createdAt: data['createdAt'] == null
						? null
						: CreatedAt.from(data['createdAt'] as Map<String, dynamic>),
			lastSeen: data['lastSeen'] == null
						? null
						: LastSeen.from(data['lastSeen'] as Map<String, dynamic>),
		);
	}

	Map<String, dynamic> to() {
		return {
			'id': id,
			'name': name,
			'isOnline': isOnline,
			'email': email,
			'createdAt': createdAt?.to(),
			'lastSeen': lastSeen?.to(),
		};
	}

	/// `dart:convert`
	///
	/// Parses the string and returns the resulting Json object as [OtherUser].
	factory OtherUser.fromJson(String data) {
		return OtherUser.from(json.decode(data) as Map<String, dynamic>);
	}

	/// `dart:convert`
	///
	/// Converts [OtherUser] to a JSON string.
	String toJson() => json.encode(to());
}
