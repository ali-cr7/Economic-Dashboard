import 'dart:convert';

import 'data.dart';

class StaisticsChartResponse {
	String? message;
	Data? data;

	StaisticsChartResponse({this.message, this.data});

	factory StaisticsChartResponse.from(Map<String, dynamic> data) {
		return StaisticsChartResponse(
			message: data['message'] as String?,
			data: data['data'] == null
						? null
						: Data.fromMessageData102030405062857142857142857708090100110120(data['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMessageData102030405062857142857142857708090100110120() {
		return {
			'message': message,
			'data': data?.toMessageData102030405062857142857142857708090100110120(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StaisticsChartResponse].
	factory StaisticsChartResponse.fromJson(String data) {
		return StaisticsChartResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [StaisticsChartResponse] to a JSON string.
	String toJson() => json.encode(toMessageData102030405062857142857142857708090100110120());
}
