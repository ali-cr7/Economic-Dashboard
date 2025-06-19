import 'dart:convert';

import 'datum.dart';

class GetIndicatorResponse {
	String? message;
	List<Datum>? data;

	GetIndicatorResponse({this.message, this.data});

	factory GetIndicatorResponse.from(Map<String, dynamic> data) {
		return GetIndicatorResponse(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMessageDataId1NameCoc2RecommendedMin10RecommendedMax20CreatedAt20250525T010204000000ZUpdatedAt20250525T010204000000ZId2NameCoc3RecommendedMin10RecommendedMax20CreatedAt20250525T010209000000ZUpdatedAt20250525T010209000000ZId3NameCoc4RecommendedMin10RecommendedMax20CreatedAt20250525T010214000000ZUpdatedAt20250525T010214000000Z(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataId1NameCoc2RecommendedMin10RecommendedMax20CreatedAt20250525T010204000000ZUpdatedAt20250525T010204000000ZId2NameCoc3RecommendedMin10RecommendedMax20CreatedAt20250525T010209000000ZUpdatedAt20250525T010209000000ZId3NameCoc4RecommendedMin10RecommendedMax20CreatedAt20250525T010214000000ZUpdatedAt20250525T010214000000Z() {
		return {
			'message': message,
			'data': data?.map((e) => e.toMessageDataId1NameCoc2RecommendedMin10RecommendedMax20CreatedAt20250525T010204000000ZUpdatedAt20250525T010204000000ZId2NameCoc3RecommendedMin10RecommendedMax20CreatedAt20250525T010209000000ZUpdatedAt20250525T010209000000ZId3NameCoc4RecommendedMin10RecommendedMax20CreatedAt20250525T010214000000ZUpdatedAt20250525T010214000000Z()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetIndicatorResponse].
	factory GetIndicatorResponse.fromJson(String data) {
		return GetIndicatorResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GetIndicatorResponse] to a JSON string.
	String toJson() => json.encode(toMessageDataId1NameCoc2RecommendedMin10RecommendedMax20CreatedAt20250525T010204000000ZUpdatedAt20250525T010204000000ZId2NameCoc3RecommendedMin10RecommendedMax20CreatedAt20250525T010209000000ZUpdatedAt20250525T010209000000ZId3NameCoc4RecommendedMin10RecommendedMax20CreatedAt20250525T010214000000ZUpdatedAt20250525T010214000000Z());
}
