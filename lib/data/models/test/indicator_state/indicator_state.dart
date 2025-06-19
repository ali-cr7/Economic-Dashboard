import 'dart:convert';

import 'indicator.dart';

class IndicatorState {
	List<Indicator>? indicators;

	IndicatorState({this.indicators});

	factory IndicatorState.fromIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7(Map<String, dynamic> data) {
		return IndicatorState(
			indicators: (data['indicators'] as List<dynamic>?)
						?.map((e) => Indicator.fromIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7() {
		return {
			'indicators': indicators?.map((e) => e.toIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [IndicatorState].
	factory IndicatorState.fromJson(String data) {
		return IndicatorState.fromIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [IndicatorState] to a JSON string.
	String toJson() => json.encode(toIndicatorsIndicatorId1Value5IndicatorId2Value5IndicatorId3Value7());

	IndicatorState copyWith({
		List<Indicator>? indicators,
	}) {
		return IndicatorState(
			indicators: indicators ?? this.indicators,
		);
	}
}
