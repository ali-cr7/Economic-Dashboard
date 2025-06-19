import 'dart:convert';

class CreatedAt {
	int? seconds;
	int? nanoseconds;

	CreatedAt({this.seconds, this.nanoseconds});

	factory CreatedAt.from(Map<String, dynamic> data) {
		return CreatedAt(
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
	/// Parses the string and returns the resulting Json object as [CreatedAt].
	factory CreatedAt.fromJson(String data) {
		return CreatedAt.from(json.decode(data) as Map<String, dynamic>);
	}

	/// `dart:convert`
	///
	/// Converts [CreatedAt] to a JSON string.
	String toJson() => json.encode(to());
}
