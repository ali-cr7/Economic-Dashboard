import 'dart:convert';

class LastSeen {
	int? seconds;
	int? nanoseconds;

	LastSeen({this.seconds, this.nanoseconds});

	factory LastSeen.from(Map<String, dynamic> data) {
		return LastSeen(
			seconds: data['_seconds'] as int?,
			nanoseconds: data['_nanoseconds'] as int?,
		);
	}

	Map<String, dynamic> to() {
		return {
			'_seconds': seconds,
			'_nanoseconds': nanoseconds,
		};
	}

	/// `dart:convert`
	///
	/// Parses the string and returns the resulting Json object as [LastSeen].
	factory LastSeen.fromJson(String data) {
		return LastSeen.from(json.decode(data) as Map<String, dynamic>);
	}

	/// `dart:convert`
	///
	/// Converts [LastSeen] to a JSON string.
	String toJson() => json.encode(to());
}
