import 'package:economic_team_desktop/buisness_logic/create%20economic%20study%20bloc/create_economic_study_bloc.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/number_picker.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/send_property_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EconomyStudySection extends StatefulWidget {
  const EconomyStudySection({
    super.key,
    required this.requestFromLawyerId,
    required this.propertyForSaleId,
    required this.agreedNegotiationId,
    required this.initialBuyingPrice,
    required this.initialExpectedPrice,
    required this.initialTotalExpectedTaxes,
    required this.initialChancePrice,
    required this.initialProfitPercent,
    required this.initialNumberOfChances,
    required this.initialInvestmentTime,
    required this.initialIncomingTime,
    required this.initialInvestmentMode,
    required this.initialPropertyManagement,
  });
  final int requestFromLawyerId;
  final int propertyForSaleId;
  final int agreedNegotiationId;

  final double initialBuyingPrice;
  final double initialExpectedPrice;
  final double initialTotalExpectedTaxes;
  final double initialChancePrice;
  final double initialProfitPercent;
  final int initialNumberOfChances;
  final String initialInvestmentTime;
  final String initialIncomingTime;
  final String initialInvestmentMode;
  final String initialPropertyManagement;

  @override
  State<EconomyStudySection> createState() => _EconomyStudySectionState();
}

class _EconomyStudySectionState extends State<EconomyStudySection> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<CreateEconomicStudyBloc>();

    bloc.add(
      UpdateAgreedNegotiationIdEvent(
        agreedNegotiationId: widget.agreedNegotiationId,
      ),
    );
    bloc.add(UpdateBuyingPriceEvent(buyingPrice: widget.initialBuyingPrice));
    bloc.add(
      UpdateExpectedPriceEvent(expectedPrice: widget.initialExpectedPrice),
    );
    bloc.add(
      UpdateTotalExpectedTaxesEvent(
        totalExpectedTaxes: widget.initialTotalExpectedTaxes,
      ),
    );
    bloc.add(UpdateChancePriceEvent(chancePrice: widget.initialChancePrice));
    bloc.add(
      UpdateProfitPercentEvent(profitPercent: widget.initialProfitPercent),
    );
    bloc.add(
      UpdateInvestmentModeEvent(investmentMode: widget.initialInvestmentMode),
    );
    bloc.add(
      UpdatePropertyManagementEvent(
        propertyManagement: widget.initialPropertyManagement,
      ),
    );
    bloc.add(
      UpdateInvestmentTimeEvent(investmentTime: widget.initialInvestmentTime),
    );
    bloc.add(UpdateIncomingTimeEvent(incomingTime: widget.initialIncomingTime));
    bloc.add(
      UpdateNumberOfChancesEvent(
        widget.requestFromLawyerId,
        widget.propertyForSaleId,
        widget.agreedNegotiationId,
        numberOfChances: widget.initialNumberOfChances,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEconomicStudyBloc, CreateEconomicStudyState>(
      builder: (context, state) {
        return SaleEstateContainer(
          width: 1200.w,
          height: 350.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              spacing: 30.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, bottom: 5.h),
                  child: Text(
                    "economy study:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  spacing: 20.w,
                  children: [
                    DropdownField(
                      label: "negotiation mode:",
                      items: ['negotiation', 'fixed'],
                      selectedValue:
                          state.agreedNegotiationId == 1
                              ? 'negotiation'
                              : 'fixed',
                      onChanged: (value) {
                        context.read<CreateEconomicStudyBloc>().add(
                          UpdateAgreedNegotiationIdEvent(
                            agreedNegotiationId: value == 'negotiation' ? 1 : 2,
                          ),
                        );
                      },
                    ),
                    NumberPicker(
                      label: "baying price:",
                      value: state.buyingPrice.toInt(),
                      onChanged: (value) {
                        context.read<CreateEconomicStudyBloc>().add(
                          UpdateBuyingPriceEvent(buyingPrice: value.toDouble()),
                        );
                      },
                      suffix: '\$',
                    ),
                    NumberPicker(
                      label: "number of chances:",
                      value: state.numberOfChances,
                      onChanged: (value) {
                        context.read<CreateEconomicStudyBloc>().add(
                          UpdateNumberOfChancesEvent(
                            widget.requestFromLawyerId,
                            widget.propertyForSaleId,
                            widget.agreedNegotiationId,
                            numberOfChances: value,
                          ),
                        );
                        // context.read<CreateEconomicStudyBloc>().add(
                        //   UpdateNumberOfChancesEvent(numberOfChances: ,
                        //   )
                        // )
                      },
                    ),
                    NumberPicker(
                      label: "expected price:",
                      value: state.expectedPrice.toInt(),
                      onChanged: (value) {
                        context.read<CreateEconomicStudyBloc>().add(
                          UpdateExpectedPriceEvent(
                            expectedPrice: value.toDouble(),
                          ),
                        );
                      },
                      suffix: '\$',
                    ),
                  ],
                ),
                Row(
                  spacing: 30.w,
                  children: [
                    NumberPicker(
                      label: "total expected taxes:",
                      value: state.totalExpectedTaxes.toInt(),
                      onChanged: (value) {
                        context.read<CreateEconomicStudyBloc>().add(
                          UpdateTotalExpectedTaxesEvent(
                            totalExpectedTaxes: value.toDouble(),
                          ),
                        );
                      },
                      suffix: '\$',
                    ),
                    NumberPicker(
                      label: "chance price:",
                      value: state.chancePrice.toInt(),
                      onChanged: (value) {
                        context.read<CreateEconomicStudyBloc>().add(
                          UpdateChancePriceEvent(chancePrice: value.toDouble()),
                        );
                      },
                      suffix: '\$',
                    ),
                    DropdownField(
                      label: "investment mode:",
                      items: ['Balanced', 'CapitalGrowth', 'HighIncoming'],
                      selectedValue: state.investmentMode,
                      onChanged: (value) {
                        context.read<CreateEconomicStudyBloc>().add(
                          UpdateInvestmentModeEvent(investmentMode: value),
                        );
                      },
                    ),
                    NumberPicker(
                      label: "profit percent:",
                      value: state.profitPercent.toInt(),
                      onChanged: (value) {
                        context.read<CreateEconomicStudyBloc>().add(
                          UpdateProfitPercentEvent(
                            profitPercent: value.toDouble(),
                          ),
                        );
                      },
                      suffix: '%',
                    ),
                  ],
                ),
                Row(
                  spacing: 20.w,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        spacing: 10.w,
                        children: [
                          Text(
                            "investment time:",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 107.w,
                            height: 26.63.h,
                            child: OutlinedButton(
                              onPressed:
                                  () => _selectDate(
                                    context,
                                    DateTime.tryParse(state.investmentTime) ??
                                        DateTime.now(),
                                    true,
                                  ),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Text(
                                //     _formatTime(state.investmentTime),
                                state.investmentTime.isNotEmpty
                                    ? DateFormat('yyyy-MM-dd').format(
                                      DateTime.parse(state.investmentTime),
                                    )
                                    : 'Select date',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        spacing: 10.w,
                        children: [
                          Text(
                            "incoming time:",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 107.w,
                            height: 26.63.h,
                            child: OutlinedButton(
                              onPressed:
                                  () => _selectDate(
                                    context,
                                    DateTime.tryParse(state.incomingTime) ??
                                        DateTime.now(),
                                    false,
                                  ),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Text(
                                state.incomingTime.isNotEmpty
                                    ? DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(DateTime.parse(state.incomingTime))
                                    : 'Select date',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownField(
                      label: "property management:",
                      items: ['rent', 'selling'],
                      selectedValue: state.propertyManagement,
                      onChanged: (value) {
                        context.read<CreateEconomicStudyBloc>().add(
                          UpdatePropertyManagementEvent(
                            propertyManagement: value,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    DateTime initialDate,
    bool isInvestment,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      final formatted = DateFormat('yyyy-MM-dd').format(picked);
      if (isInvestment) {
        context.read<CreateEconomicStudyBloc>().add(
          UpdateInvestmentTimeEvent(investmentTime: formatted),
        );
      } else {
        context.read<CreateEconomicStudyBloc>().add(
          UpdateIncomingTimeEvent(incomingTime: formatted),
        );
      }
    }
  }
}
