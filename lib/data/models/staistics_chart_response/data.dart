import 'dart:convert';

class Data {
	double? one;
	double? two;
	double? three;
	double? four;
	double? five;
	double? six;
	double? seven;
	double? eight;
	double? nine;
	double? ten;
	double? eleven;
	double? twelve;

	Data({
		this.one, 
		this.two, 
		this.three, 
		this.four, 
		this.five, 
		this.six, 
		this.seven, 
		this.eight, 
		this.nine, 
		this.ten, 
		this.eleven, 
		this.twelve, 
	});

	factory Data.fromMessageData102030405062857142857142857708090100110120(Map<String, dynamic> data) {
		return Data(
		one: (data['1'] as num?)?.toDouble(),
		two: (data['2'] as num?)?.toDouble(),
		three: (data['3'] as num?)?.toDouble(),
	four: (data['4'] as num?)?.toDouble(),
five: (data['5'] as num?)?.toDouble(),
			six: (data['6'] as num?)?.toDouble(),
		seven: (data['7'] as num?)?.toDouble(),
	eight: (data['8'] as num?)?.toDouble(),
		nine: (data['9'] as num?)?.toDouble(),
		ten: (data['10'] as num?)?.toDouble(),
		eleven: (data['11'] as num?)?.toDouble(),
		twelve: (data['12'] as num?)?.toDouble(),
		);
	}



	Map<String, dynamic> toMessageData102030405062857142857142857708090100110120() {
		return {
			'1': one,
			'2': two,
			'3': three,
			'4': four,
			'5': five,
			'6': six,
			'7': seven,
			'8': eight,
			'9': nine,
			'10': ten,
			'11': eleven,
			'12': twelve,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
	factory Data.fromJson(String data) {
		return Data.fromMessageData102030405062857142857142857708090100110120(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
	String toJson() => json.encode(toMessageData102030405062857142857142857708090100110120());
}
