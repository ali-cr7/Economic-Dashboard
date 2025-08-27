import 'dart:convert';

class Property {
	int? propertyId;
	String? propertyTitle;
	String? propertyLocation;
	int? totalChances;
	int? isCompleted;
	dynamic totalInvested;
	String? chancePrice;
	String? progressPercent;

	Property({
		this.propertyId, 
		this.propertyTitle, 
		this.propertyLocation, 
		this.totalChances, 
		this.isCompleted, 
		this.totalInvested, 
		this.chancePrice, 
		this.progressPercent, 
	});

	factory Property.fromMessageDataPropertiesPropertyId1PropertyTitleLandPropertyLocationDamascusCountrysideTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId2PropertyTitleAppartmentPropertyLocationDamascusTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId3PropertyTitleVillaPropertyLocationLatakiaTotalChances11IsCompleted0TotalInvested35100000ChancePrice900000ProgressPercent10000PropertyId4PropertyTitleAppartmentPropertyLocationHalabTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId5PropertyTitleLandPropertyLocationTartousTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId6PropertyTitleVillaPropertyLocationDamascusTotalChances44IsCompleted0TotalInvested5400000ChancePrice900000ProgressPercent1277PaginationCurrentPage1LastPage4PerPage6Total20NextPageUrlHttp1270018000ApiV1GetInvestmentPropertyInfoPage2PrevPageUrlNull(Map<String, dynamic> data) {
		return Property(
			propertyId: data['property_id'] as int?,
			propertyTitle: data['property_title'] as String?,
			propertyLocation: data['property_location'] as String?,
			totalChances: data['total_chances'] as int?,
			isCompleted: data['is_completed'] as int?,
			totalInvested: data['total_invested'],
			chancePrice: data['chance_price'] as String?,
			progressPercent: data['progress_percent'] as String?,
		);
	}

	// Clean parser for normal API shape
	factory Property.fromApi(Map<String, dynamic> json) {
		return Property(
			propertyId: json['property_id'] as int?,
			propertyTitle: json['property_title'] as String?,
			propertyLocation: json['property_location'] as String?,
			totalChances: json['total_chances'] as int?,
			isCompleted: json['is_completed'] as int?,
			totalInvested: json['total_invested'],
			chancePrice: json['chance_price'] as String?,
			progressPercent: json['progress_percent'] as String?,
		);
	}

	Map<String, dynamic> toMessageDataPropertiesPropertyId1PropertyTitleLandPropertyLocationDamascusCountrysideTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId2PropertyTitleAppartmentPropertyLocationDamascusTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId3PropertyTitleVillaPropertyLocationLatakiaTotalChances11IsCompleted0TotalInvested35100000ChancePrice900000ProgressPercent10000PropertyId4PropertyTitleAppartmentPropertyLocationHalabTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId5PropertyTitleLandPropertyLocationTartousTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId6PropertyTitleVillaPropertyLocationDamascusTotalChances44IsCompleted5400000ChancePrice900000ProgressPercent1277PaginationCurrentPage1LastPage4PerPage6Total20NextPageUrlHttp1270018000ApiV1GetInvestmentPropertyInfoPage2PrevPageUrlNull() {
		return {
			'property_id': propertyId,
			'property_title': propertyTitle,
			'property_location': propertyLocation,
			'total_chances': totalChances,
			'is_completed': isCompleted,
			'total_invested': totalInvested,
			'chance_price': chancePrice,
			'progress_percent': progressPercent,		};
	}

	/// `dart:convert`
	///
	/// Parses the string and returns the resulting Json object as [Property].
	factory Property.fromJson(String data) {
		return Property.fromApi(json.decode(data) as Map<String, dynamic>);
	}
	/// `dart:convert`
	///
	/// Converts [Property] to a JSON string.
	String toJson() => json.encode(toMessageDataPropertiesPropertyId1PropertyTitleLandPropertyLocationDamascusCountrysideTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId2PropertyTitleAppartmentPropertyLocationDamascusTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId3PropertyTitleVillaPropertyLocationLatakiaTotalChances11IsCompleted0TotalInvested35100000ChancePrice900000ProgressPercent10000PropertyId4PropertyTitleAppartmentPropertyLocationHalabTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId5PropertyTitleLandPropertyLocationTartousTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId6PropertyTitleVillaPropertyLocationDamascusTotalChances44IsCompleted5400000ChancePrice900000ProgressPercent1277PaginationCurrentPage1LastPage4PerPage6Total20NextPageUrlHttp1270018000ApiV1GetInvestmentPropertyInfoPage2PrevPageUrlNull());
}
