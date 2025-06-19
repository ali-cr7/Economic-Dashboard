import 'package:economic_team_desktop/data/models/request_details_response/data.dart'
    show RequestData;
import 'package:economic_team_desktop/presentation/requests/widgets/economy_study.dart';
import 'package:flutter/widgets.dart';

class EconomyStudyPart extends StatelessWidget {
  const EconomyStudyPart({
    super.key,
    required this.item,
    required this.agreedNegotiationStatus,
    required this.requestId,
    required this.agreedNegotiationId,
    required this.byWhom, required this.propertyForSaleId,
  });

  final RequestData? item;
  final String? agreedNegotiationStatus;
  final String requestId;
  final String byWhom;
  final int? agreedNegotiationId;
  final String propertyForSaleId;
  
  @override
  Widget build(BuildContext context) {
    return EconomyStudySection(
      byWhom: byWhom,
      item: item,
      agreedNegotiationStatus: agreedNegotiationStatus,
      //    agreedNegotiationId: agreedNegotiationId,
      requestId: requestId,
      initialBuyingPrice: item!.economicEvaluation!.buyingPrice!.toDouble(),
      initialChancePrice: item!.economicEvaluation!.chancePrice!.toDouble(),
      initialExpectedPrice: item!.economicEvaluation!.expectedPrice!.toDouble(),
      initialIncomingTime: item!.economicEvaluation!.incomingTime!,
      initialInvestmentMode: item!.economicEvaluation!.investmentMode!,
      initialInvestmentTime: item!.economicEvaluation!.investmentTime!,
      initialNumberOfChances: item!.economicEvaluation!.numberOfChances!,
      initialProfitPercent: item!.economicEvaluation!.profitPercent!.toDouble(),
      initialPropertyManagement: item!.economicEvaluation!.propertyManagement!,
      initialTotalExpectedTaxes:
          item!.economicEvaluation!.totalExpectedTaxes!.toDouble(),
      agreedNegotiationId: agreedNegotiationId!,
      propertyForSaleId: propertyForSaleId,
      requestFromLawyerId: int.tryParse(requestId)!,
    );
  }
}
