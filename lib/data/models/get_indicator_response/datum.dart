import 'dart:convert';

class Datum {
	int? id;
	String? name;
	int? recommendedMin;
	int? recommendedMax;
	DateTime? createdAt;
	DateTime? updatedAt;

	Datum({
		this.id, 
		this.name, 
		this.recommendedMin, 
		this.recommendedMax, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Datum.fromMessageDataId1NameCoc2RecommendedMin10RecommendedMax20CreatedAt20250525T010204000000ZUpdatedAt20250525T010204000000ZId2NameCoc3RecommendedMin10RecommendedMax20CreatedAt20250525T010209000000ZUpdatedAt20250525T010209000000ZId3NameCoc4RecommendedMin10RecommendedMax20CreatedAt20250525T010214000000ZUpdatedAt20250525T010214000000Z(Map<String, dynamic> data) {
		return Datum(
			id: data['id'] as int?,
			name: data['name'] as String?,
			recommendedMin: data['recommended_min'] as int?,
			recommendedMax: data['recommended_max'] as int?,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
		);
	}



	Map<String, dynamic> toMessageDataId1NameCoc2RecommendedMin10RecommendedMax20CreatedAt20250525T010204000000ZUpdatedAt20250525T010204000000ZId2NameCoc3RecommendedMin10RecommendedMax20CreatedAt20250525T010209000000ZUpdatedAt20250525T010209000000ZId3NameCoc4RecommendedMin10RecommendedMax20CreatedAt20250525T010214000000ZUpdatedAt20250525T010214000000Z() {
		return {
			'id': id,
			'name': name,
			'recommended_min': recommendedMin,
			'recommended_max': recommendedMax,
			'created_at': createdAt?.toIso8601String(),
			'updated_at': updatedAt?.toIso8601String(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMessageDataId1NameCoc2RecommendedMin10RecommendedMax20CreatedAt20250525T010204000000ZUpdatedAt20250525T010204000000ZId2NameCoc3RecommendedMin10RecommendedMax20CreatedAt20250525T010209000000ZUpdatedAt20250525T010209000000ZId3NameCoc4RecommendedMin10RecommendedMax20CreatedAt20250525T010214000000ZUpdatedAt20250525T010214000000Z(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMessageDataId1NameCoc2RecommendedMin10RecommendedMax20CreatedAt20250525T010204000000ZUpdatedAt20250525T010204000000ZId2NameCoc3RecommendedMin10RecommendedMax20CreatedAt20250525T010209000000ZUpdatedAt20250525T010209000000ZId3NameCoc4RecommendedMin10RecommendedMax20CreatedAt20250525T010214000000ZUpdatedAt20250525T010214000000Z());
}
