import 'dart:convert';

class Datum {
	int? id;
	String? name;
	String? arabicName;
	double? recommendedMin;
	double? recommendedMax;
	DateTime? createdAt;
	DateTime? updatedAt;

	Datum({
		this.id, 
		this.name, 
		this.arabicName, 
		this.recommendedMin, 
		this.recommendedMax, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Datum.fromMessageDataId1NameResidentialCapRateArabicNameRecommendedMin35RecommendedMax55CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId2NameCommercialCapRateArabicNameRecommendedMin6RecommendedMax9CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId3NameCashOnCashReturnArabicNameRecommendedMin55RecommendedMax11CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId4NameInternalRateOfReturnArabicNameRecommendedMin10RecommendedMax165CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId5NameVacancyRateArabicNameRecommendedMin65RecommendedMax125CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId6NameOperatingExpenseRatioArabicNameRecommendedMin275RecommendedMax425CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000Z(Map<String, dynamic> data) {
		return Datum(
			id: data['id'] as int?,
			name: data['name'] as String?,
			arabicName: data['arabic_name'] as String?,
			recommendedMin: (data['recommended_min'] as num?)?.toDouble(),
			recommendedMax: (data['recommended_max'] as num?)?.toDouble(),
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
		);
	}



	Map<String, dynamic> toMessageDataId1NameResidentialCapRateArabicNameRecommendedMin35RecommendedMax55CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId2NameCommercialCapRateArabicNameRecommendedMin6RecommendedMax9CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId3NameCashOnCashReturnArabicNameRecommendedMin55RecommendedMax11CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId4NameInternalRateOfReturnArabicNameRecommendedMin10RecommendedMax165CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId5NameVacancyRateArabicNameRecommendedMin65RecommendedMax125CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId6NameOperatingExpenseRatioArabicNameRecommendedMin275RecommendedMax425CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000Z() {
		return {
			'id': id,
			'name': name,
			'arabic_name': arabicName,
			'recommended_min': recommendedMin,
			'recommended_max': recommendedMax,
			'created_at': createdAt?.toIso8601String(),
			'updated_at': updatedAt?.toIso8601String(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMessageDataId1NameResidentialCapRateArabicNameRecommendedMin35RecommendedMax55CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId2NameCommercialCapRateArabicNameRecommendedMin6RecommendedMax9CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId3NameCashOnCashReturnArabicNameRecommendedMin55RecommendedMax11CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId4NameInternalRateOfReturnArabicNameRecommendedMin10RecommendedMax165CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId5NameVacancyRateArabicNameRecommendedMin65RecommendedMax125CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId6NameOperatingExpenseRatioArabicNameRecommendedMin275RecommendedMax425CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000Z(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMessageDataId1NameResidentialCapRateArabicNameRecommendedMin35RecommendedMax55CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId2NameCommercialCapRateArabicNameRecommendedMin6RecommendedMax9CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId3NameCashOnCashReturnArabicNameRecommendedMin55RecommendedMax11CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId4NameInternalRateOfReturnArabicNameRecommendedMin10RecommendedMax165CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId5NameVacancyRateArabicNameRecommendedMin65RecommendedMax125CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000ZId6NameOperatingExpenseRatioArabicNameRecommendedMin275RecommendedMax425CreatedAt20250630T230532000000ZUpdatedAt20250630T230532000000Z());
}
