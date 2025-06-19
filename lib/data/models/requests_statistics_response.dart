import 'dart:convert';

class RequestsStatisticsResponse {
  String? message;
  double? rejectedByLawyerPercentage;
  double? acceptedByAdminPercentage;
  double? rejectedByUserPercentage;
  int? year;

  RequestsStatisticsResponse({
    this.message,
    this.rejectedByLawyerPercentage,
    this.acceptedByAdminPercentage,
    this.rejectedByUserPercentage,
    this.year,
  });

  factory RequestsStatisticsResponse.from(Map<String, dynamic> data) {
    return RequestsStatisticsResponse(
      message: data['message'] as String?,
      rejectedByLawyerPercentage:
          (data['rejected_by_lawyer_percentage'] as num?)?.toDouble(),
      acceptedByAdminPercentage:
          (data['accepted_by_admin_percentage'] as num?)?.toDouble(),
      rejectedByUserPercentage:
          (data['rejected_by_user_percentage'] as num?)?.toDouble(),
      year: data['year'] as int?,
    );
  }

  Map<String, dynamic>
  toMessageRejectedByLawyerPercentage0AcceptedByAdminPercentage2857RejectedByUserPercentage2857Year2025() {
    return {
      'message': message,
      'rejected_by_lawyer_percentage': rejectedByLawyerPercentage,
      'accepted_by_admin_percentage': acceptedByAdminPercentage,
      'rejected_by_user_percentage': rejectedByUserPercentage,
      'year': year,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RequestsStatisticsResponse].
  factory RequestsStatisticsResponse.fromJson(String data) {
    return RequestsStatisticsResponse.from(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [RequestsStatisticsResponse] to a JSON string.
  String toJson() => json.encode(
    toMessageRejectedByLawyerPercentage0AcceptedByAdminPercentage2857RejectedByUserPercentage2857Year2025(),
  );
}
