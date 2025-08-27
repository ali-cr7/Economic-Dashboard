import 'package:economic_team_desktop/buisness_logic/create%20property%20indicator%20bloc/create_property_indicators_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20indicators/property_indicators_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20property%20indicators%20bloc/send_property_indicators_bloc.dart';
import 'package:economic_team_desktop/data/models/request_details_response/data.dart';
import 'package:economic_team_desktop/data/models/request_details_response/indicator_value.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/custom_button.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/custom_cash_flow_list_input.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/custom_text_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/label_widget.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/number_picker.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyIndicators extends StatefulWidget {
  const PropertyIndicators({
    super.key,
    required this.item,
    required this.propertyId,
  });

  final RequestData? item;
  final String propertyId;

  @override
  State<PropertyIndicators> createState() => _PropertyIndicatorsState();
}

class _PropertyIndicatorsState extends State<PropertyIndicators> {
  final _residentialNOI = TextEditingController();
  final _residentialValue = TextEditingController();

  final _commercialNOI = TextEditingController();
  final _commercialValue = TextEditingController();

  final _annualCashFlow = TextEditingController();
  final _cashInvested = TextEditingController();

  final _vacantUnits = TextEditingController();
  final _totalUnits = TextEditingController();

  final _operatingExpenses = TextEditingController();
  final _operatingNOI = TextEditingController();

  final List<TextEditingController> _cashFlows = [TextEditingController()];
  bool get hasIndicators =>
      widget.item?.economicEvaluation?.indicatorValues?.isNotEmpty ?? false;
  List<IndicatorValue> get indicatorValues =>
      widget.item?.economicEvaluation?.indicatorValues ?? [];
  @override
  void initState() {
    super.initState();
    _setupListeners();
  }

  void _setupListeners() {
    _residentialNOI.addListener(() => _dispatchResidentialEvent());
    _residentialValue.addListener(() => _dispatchResidentialEvent());

    _commercialNOI.addListener(() => _dispatchCommercialEvent());
    _commercialValue.addListener(() => _dispatchCommercialEvent());

    _annualCashFlow.addListener(() => _dispatchCashReturnEvent());
    _cashInvested.addListener(() => _dispatchCashReturnEvent());

    _vacantUnits.addListener(() => _dispatchVacancyEvent());
    _totalUnits.addListener(() => _dispatchVacancyEvent());

    _operatingExpenses.addListener(() => _dispatchOEREvent());
    _operatingNOI.addListener(() => _dispatchOEREvent());
  }

  void _dispatchResidentialEvent() {
    context.read<CreatePropertyIndicatorsBloc>().add(
      UpdateResidentialCapRateEvent(
        netOperatingIncome: double.tryParse(_residentialNOI.text) ?? 0,
        propertyValue: double.tryParse(_residentialValue.text) ?? 0,
      ),
    );
  }

  void _dispatchCommercialEvent() {
    context.read<CreatePropertyIndicatorsBloc>().add(
      UpdateCommercialCapRateEvent(
        netOperatingIncome: double.tryParse(_commercialNOI.text) ?? 0,
        propertyValue: double.tryParse(_commercialValue.text) ?? 0,
      ),
    );
  }

  void _dispatchCashReturnEvent() {
    context.read<CreatePropertyIndicatorsBloc>().add(
      UpdateCashOnCashReturnEvent(
        annualCashFlow: double.tryParse(_annualCashFlow.text) ?? 0,
        cashInvested: double.tryParse(_cashInvested.text) ?? 0,
      ),
    );
  }

  void _dispatchVacancyEvent() {
    context.read<CreatePropertyIndicatorsBloc>().add(
      UpdateVacancyRateEvent(
        vacantUnits: int.tryParse(_vacantUnits.text) ?? 0,
        totalUnits: int.tryParse(_totalUnits.text) ?? 0,
      ),
    );
  }

  void _dispatchOEREvent() {
    context.read<CreatePropertyIndicatorsBloc>().add(
      UpdateOperatingExpenseRatioEvent(
        operatingExpenses: double.tryParse(_operatingExpenses.text) ?? 0,
        netOperatingIncome: double.tryParse(_operatingNOI.text) ?? 0,
      ),
    );
  }

  void _dispatchIRREvent(List<double> cashFlows) {
    context.read<CreatePropertyIndicatorsBloc>().add(
      UpdateInternalRateOfReturnEvent(cashFlows: cashFlows),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      SendPropertyIndicatorsBloc,
      SendPropertyIndicatorsState
    >(
      listener: (context, state) {
        if (state is SendPropertyIndicatorsLoading) {
          EasyLoading.show(status: 'loading...');
        } else if (state is SendPropertyIndicatorsStatus &&
            state.helperResponse.fullBody?["message"] ==
                "Economic evaluation not found.") {
          EasyLoading.dismiss();
          EasyLoading.showError("Send the economic evaluation first.");
        } else if (state is SendPropertyIndicatorsStatus) {
          EasyLoading.showSuccess(state.helperResponse.fullBody?["message"]);
          context.read<PropertyRequestDetailsBloc>().add(
            GetPropertiesRequestDetailsEvent(
              requestId: widget.item!.id.toString(),
            ),
          );
        }
      },
      child: Column(
        children: [
          const LabelWidget(text: "Property Economic Indicators"),
          SaleEstateContainer(
            height: 450.h,
            width: 1000.w,
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<
                    PropertyIndicatorsBloc,
                    PropertyIndicatorsState
                  >(
                    builder: (context, state) {
                      if (state is PropertyIndicatorsLoading) {
                        return const CircularProgressIndicator();
                      }

                      if (state is PropertyIndicatorsSuccess) {
                        final indicatorsList = state.getIndicatorResponse.data!;

                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                          itemCount: indicatorsList.length,
                          itemBuilder: (context, index) {
                            final indicator = indicatorsList[index];
                            final existing = indicatorValues.firstWhere(
                              (e) => e.indicatorName == indicator.name,
                              orElse:
                                  () => IndicatorValue(
                                    indicatorName: indicator.name,
                                    value: null,
                                  ),
                            );

                            return Card(
                              elevation: 3,
                              margin: EdgeInsets.symmetric(
                                vertical: 8.w,
                                horizontal: 12.w,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      indicator.name ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    Expanded(
                                      child: buildIndicatorInputForm(
                                        context,
                                        indicator,
                                        readOnly: hasIndicators,
                                        value: existing.value,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
                if (!hasIndicators)
                  BlocBuilder<
                    CreatePropertyIndicatorsBloc,
                    CreatePropertyIndicatorsState
                  >(
                    builder: (context, state) {
                      return CustomSendButton(
                        onTap: () {
                          context.read<SendPropertyIndicatorsBloc>().add(
                            SendPropertyApiIndicatorsEvent(
                              createPropertyIndicatorsState: state,
                              id: widget.propertyId,
                            ),
                          );
                        },
                        height: 50.h,
                        width: 80.w,
                        buttonName: 'send',
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicatorInputForm(
    BuildContext context,
    dynamic indicator, {
    bool readOnly = false,
    double? value,
  }) {
    if (readOnly) {
      return Center(
        child: Text(
          value?.toStringAsFixed(2) ?? '-',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      );
    }

    switch (indicator.name) {
      case "Residential Cap Rate":
        return Column(
          children: [
            Expanded(
              child: CustomTextField(
                label: "Net Operating Income",
                controller: _residentialNOI,
              ),
            ),
            Expanded(
              child: CustomTextField(
                label: "Property Value",
                controller: _residentialValue,
              ),
            ),
          ],
        );

      case "Commercial Cap Rate":
        return Column(
          children: [
            Expanded(
              child: CustomTextField(
                label: "Net Operating Income",
                controller: _commercialNOI,
              ),
            ),
            Expanded(
              child: CustomTextField(
                label: "Property Value",
                controller: _commercialValue,
              ),
            ),
          ],
        );

      case "Cash on Cash Return":
        return Column(
          children: [
            Expanded(
              child: CustomTextField(
                label: "Annual Cash Flow",
                controller: _annualCashFlow,
              ),
            ),
            Expanded(
              child: CustomTextField(
                label: "Cash Invested",
                controller: _cashInvested,
              ),
            ),
          ],
        );

      case "Internal Rate of Return":
        return Column(
          children: [
            Text(
              "Add multiple yearly cash flows",
              style: TextStyle(fontSize: 12.sp),
            ),
            Expanded(
              child: CustomCashFlowListInput(
                onChanged: (cashFlows) => _dispatchIRREvent(cashFlows),
              ),
            ),
          ],
        );

      case "Vacancy Rate":
        return Column(
          children: [
            Expanded(
              child: CustomTextField(
                label: "Vacant Units",
                controller: _vacantUnits,
              ),
            ),
            Expanded(
              child: CustomTextField(
                label: "Total Units",
                controller: _totalUnits,
              ),
            ),
          ],
        );

      case "Operating Expense Ratio":
        return Column(
          children: [
            Expanded(
              child: CustomTextField(
                label: "Operating Expenses",
                controller: _operatingExpenses,
              ),
            ),
            Expanded(
              child: CustomTextField(
                label: "Net Operating Income",
                controller: _operatingNOI,
              ),
            ),
          ],
        );

      default:
        return const Text("Unsupported indicator");
    }
  }
}
