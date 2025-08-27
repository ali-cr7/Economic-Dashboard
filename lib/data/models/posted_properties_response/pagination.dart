import 'dart:convert';

class Pagination {
	int? currentPage;
	int? lastPage;
	int? perPage;
	int? total;
	String? nextPageUrl;
	dynamic prevPageUrl;

	Pagination({
		this.currentPage, 
		this.lastPage, 
		this.perPage, 
		this.total, 
		this.nextPageUrl, 
		this.prevPageUrl, 
	});

	factory Pagination.fromMessageDataPropertiesPropertyId1PropertyTitleLandPropertyLocationDamascusCountrysideTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId2PropertyTitleAppartmentPropertyLocationDamascusTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId3PropertyTitleVillaPropertyLocationLatakiaTotalChances11IsCompleted0TotalInvested35100000ChancePrice900000ProgressPercent10000PropertyId4PropertyTitleAppartmentPropertyLocationHalabTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId5PropertyTitleLandPropertyLocationTartousTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent1277PaginationCurrentPage1LastPage4PerPage6Total20NextPageUrlHttp1270018000ApiV1GetInvestmentPropertyInfoPage2PrevPageUrlNull(Map<String, dynamic> data) {
		return Pagination(
			currentPage: data['current_page'] as int?,
			lastPage: data['last_page'] as int?,
			perPage: data['per_page'] as int?,
			total: data['total'] as int?,
			nextPageUrl: data['next_page_url'] as String?,
			prevPageUrl: data['prev_page_url'] as dynamic,
		);
	}

	// Clean parser for normal API shape
	factory Pagination.fromApi(Map<String, dynamic> json) {
		return Pagination(
			currentPage: json['current_page'] as int?,
			lastPage: json['last_page'] as int?,
			perPage: json['per_page'] as int?,
			total: json['total'] as int?,
			nextPageUrl: json['next_page_url'] as String?,
			prevPageUrl: json['prev_page_url'],
		);
	}

	Map<String, dynamic> toMessageDataPropertiesPropertyId1PropertyTitleLandPropertyLocationDamascusCountrysideTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId2PropertyTitleAppartmentPropertyLocationDamascusTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId3PropertyTitleVillaPropertyLocationLatakiaTotalChances11IsCompleted0TotalInvested35100000ChancePrice900000ProgressPercent10000PropertyId4PropertyTitleAppartmentPropertyLocationHalabTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent1277PaginationCurrentPage1LastPage4PerPage6Total20NextPageUrlHttp1270018000ApiV1GetInvestmentPropertyInfoPage2PrevPageUrlNull() {
		return {
			'current_page': currentPage,
			'last_page': lastPage,
			'per_page': perPage,
			'total': total,
			'next_page_url': nextPageUrl,
			'prev_page_url': prevPageUrl,		};
	}

	/// `dart:convert`
	///
	/// Parses the string and returns the resulting Json object as [Pagination].
	factory Pagination.fromJson(String data) {
		return Pagination.fromApi(json.decode(data) as Map<String, dynamic>);
	}
	/// `dart:convert`
	///
	/// Converts [Pagination] to a JSON string.
	String toJson() => json.encode(toMessageDataPropertiesPropertyId1PropertyTitleLandPropertyLocationDamascusCountrysideTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId2PropertyTitleAppartmentPropertyLocationDamascusTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent000PropertyId3PropertyTitleVillaPropertyLocationLatakiaTotalChances11IsCompleted0TotalInvested35100000ChancePrice900000ProgressPercent10000PropertyId4PropertyTitleAppartmentPropertyLocationHalabTotalChances50IsCompleted0TotalInvested0ChancePrice900000ProgressPercent1277PaginationCurrentPage1LastPage4PerPage6Total20NextPageUrlHttp1270018000ApiV1GetInvestmentPropertyInfoPage2PrevPageUrlNull());
}
