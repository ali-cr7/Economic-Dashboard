import 'package:economic_team_desktop/data/models/request_details_response/data.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/send_property_button.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.item,
    required this.agreedNegotiationStatus,
    required this.agreedNegotiationId,
    required this.requestId, required this.byWhom,
  });

  final RequestData? item;
  final String? agreedNegotiationStatus;
  final int? agreedNegotiationId;
  final String requestId;
  final String? byWhom;

  @override
  Widget build(BuildContext context) {
    return SendPropertyButton(
      byWhom: byWhom!,
      requestId: item!.id!,
      isCompleted: item!.economicEvaluation!.profitPercent! != 0,
      isUserAccepted:
          agreedNegotiationStatus == 'تم قبول الطلب من قبل المستخدم',
      negotiationId: agreedNegotiationId!,
      propertyForSaleId: int.tryParse(requestId)!,
      requestFromLawyerId: int.tryParse(requestId)!,
    );
  }
}
