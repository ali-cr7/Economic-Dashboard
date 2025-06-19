import 'dart:convert';

class Indicator {
	int? indicatorId;
	int? value;

	Indicator({this.indicatorId, this.value});

	factory Indicator.fromIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7(Map<String, dynamic> data) {
		return Indicator(
			indicatorId: data['indicator_id'] as int?,
			value: data['value'] as int?,
		);
	}



	Map<String, dynamic> toIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7() {
		return {
			'indicator_id': indicatorId,
			'value': value,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Indicator].
	factory Indicator.fromJson(String data) {
		return Indicator.fromIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Indicator] to a JSON string.
	String toJson() => json.encode(toIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7());

	Indicator copyWith({
		int? indicatorId,
		int? value,
	}) {
		return Indicator(
			indicatorId: indicatorId ?? this.indicatorId,
			value: value ?? this.value,
		);
	}
}
