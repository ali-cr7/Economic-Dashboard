part of 'create_property_indicators_bloc.dart';

@immutable
class CreatePropertyIndicatorsState {
  final Map<String, dynamic> residentialCapRateData;
  final Map<String, dynamic> commercialCapRateData;
  final Map<String, dynamic> cashOnCashReturnData;
  final Map<String, dynamic> internalRateOfReturnData;
  final Map<String, dynamic> vacancyRateData;
  final Map<String, dynamic> operatingExpenseRatioData;

  const CreatePropertyIndicatorsState({
    this.residentialCapRateData = const {},
    this.commercialCapRateData = const {},
    this.cashOnCashReturnData = const {},
    this.internalRateOfReturnData = const {},
    this.vacancyRateData = const {},
    this.operatingExpenseRatioData = const {},
  });

  CreatePropertyIndicatorsState copyWith({
    Map<String, dynamic>? residentialCapRateData,
    Map<String, dynamic>? commercialCapRateData,
    Map<String, dynamic>? cashOnCashReturnData,
    Map<String, dynamic>? internalRateOfReturnData,
    Map<String, dynamic>? vacancyRateData,
    Map<String, dynamic>? operatingExpenseRatioData,
  }) {
    return CreatePropertyIndicatorsState(
      residentialCapRateData:
          residentialCapRateData ?? this.residentialCapRateData,
      commercialCapRateData:
          commercialCapRateData ?? this.commercialCapRateData,
      cashOnCashReturnData: cashOnCashReturnData ?? this.cashOnCashReturnData,
      internalRateOfReturnData:
          internalRateOfReturnData ?? this.internalRateOfReturnData,
      vacancyRateData: vacancyRateData ?? this.vacancyRateData,
      operatingExpenseRatioData:
          operatingExpenseRatioData ?? this.operatingExpenseRatioData,
    );
  }

  Map<String, dynamic> toMap(int propertyId) {
    return {
      'property_id': propertyId,
      'indicators': [
        {'indicator_id': 1, 'data': residentialCapRateData},
        {'indicator_id': 2, 'data': commercialCapRateData},
        {'indicator_id': 3, 'data': cashOnCashReturnData},
        {'indicator_id': 4, 'data': internalRateOfReturnData},
        {'indicator_id': 5, 'data': vacancyRateData},
        {'indicator_id': 6, 'data': operatingExpenseRatioData},
      ],
    };
  }

  Future<FormData> toFormData(int propertyId) async {
    final map = toMap(propertyId);
    final indicators = map['indicators'] as List;

    // Build FormData with proper array format
    final formData = FormData.fromMap({'property_id': propertyId.toString()});

    // Add each indicator as separate array elements
    for (int i = 0; i < indicators.length; i++) {
      final indicator = indicators[i] as Map<String, dynamic>;
      formData.fields.add(
        MapEntry(
          'indicators[$i][indicator_id]',
          indicator['indicator_id'].toString(),
        ),
      );

      // Add each data field
      final data = indicator['data'] as Map<String, dynamic>;
      data.forEach((key, value) {
        if (value is List) {
          // Handle array fields like cash_flows
          for (int j = 0; j < value.length; j++) {
            formData.fields.add(
              MapEntry('indicators[$i][data][$key][$j]', value[j].toString()),
            );
          }
        } else {
          formData.fields.add(
            MapEntry('indicators[$i][data][$key]', value.toString()),
          );
        }
      });
    }

    return formData;
  }

  factory CreatePropertyIndicatorsState.fromMap(Map<String, dynamic> map) {
    final List indicators = map['indicators'] ?? [];

    Map<int, Map<String, dynamic>> indicatorMap = {
      for (var ind in indicators)
        (ind['indicator_id'] ?? 0): Map<String, dynamic>.from(
          ind['data'] ?? {},
        ),
    };

    return CreatePropertyIndicatorsState(
      residentialCapRateData: indicatorMap[1] ?? {},
      commercialCapRateData: indicatorMap[2] ?? {},
      cashOnCashReturnData: indicatorMap[3] ?? {},
      internalRateOfReturnData: indicatorMap[4] ?? {},
      vacancyRateData: indicatorMap[5] ?? {},
      operatingExpenseRatioData: indicatorMap[6] ?? {},
    );
  }

  factory CreatePropertyIndicatorsState.fromJson(String source) =>
      CreatePropertyIndicatorsState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreateIndicatorValueState(residentialCapRateData: $residentialCapRateData, '
        'commercialCapRateData: $commercialCapRateData, '
        'cashOnCashReturnData: $cashOnCashReturnData, '
        'internalRateOfReturnData: $internalRateOfReturnData, '
        'vacancyRateData: $vacancyRateData, '
        'operatingExpenseRatioData: $operatingExpenseRatioData)';
  }
}

final class CreatePropertyIndicatorsInitial
    extends CreatePropertyIndicatorsState {}
