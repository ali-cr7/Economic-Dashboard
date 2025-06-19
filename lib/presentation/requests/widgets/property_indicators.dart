import 'package:economic_team_desktop/buisness_logic/create%20property%20indicators%20bloc/create_property_indicators_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20indicators/property_indicators_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20property%20indicators%20bloc/send_property_indicators_bloc.dart';
import 'package:economic_team_desktop/data/models/request_details_response/data.dart';
import 'package:economic_team_desktop/data/models/request_details_response/indicator_value.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/custom_button.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/label_widget.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/number_picker.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyIndicators extends StatelessWidget {
  const PropertyIndicators({super.key, required this.item});

  final RequestData? item;

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
            state.helperResponse.fullBody!['message'] ==
                "Economic evaluation not found.") {
          EasyLoading.dismiss();
          EasyLoading.showError("Send the economic evaluation first.");
        } else if (state is SendPropertyIndicatorsStatus) {
          EasyLoading.showSuccess(state.helperResponse.fullBody!['message']);
          context.read<PropertyRequestDetailsBloc>().add(
            GetPropertiesRequestDetailsEvent(requestId: item!.id.toString()),
          );
        }
      },
      child: Column(
        children: [
          LabelWidget(text: "Property Economic Indicators"),

          SaleEstateContainer(
            height: 248.w,
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
                        final indicatorValues =
                            item!.economicEvaluation?.indicatorValues ?? [];

                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisExtent: 50,
                              ),
                          itemCount: indicatorsList.length,
                          itemBuilder: (context, index) {
                            final indicator = indicatorsList[index];

                            final existing = indicatorValues.firstWhere(
                              (iv) => iv.indicatorId == indicator.id,
                              orElse:
                                  () => IndicatorValue(
                                    indicatorId: indicator.id!,
                                    value: 0,
                                  ),
                            );

                            return NumberPicker(
                              label:
                                  existing.indicatorName ??
                                  indicator.name ??
                                  '',
                              value: existing.value ?? 0,
                              onChanged: (newValue) {
                                final currentState =
                                    context
                                        .read<CreatePropertyIndicatorsBloc>()
                                        .state;
                                final existingIndicators =
                                    currentState.indicators ?? [];

                                final updatedValues = List<IndicatorValue>.from(
                                  existingIndicators,
                                );

                                final indexToUpdate = updatedValues.indexWhere(
                                  (iv) => iv.indicatorId == indicator.id,
                                );

                                if (indexToUpdate != -1) {
                                  updatedValues[indexToUpdate] =
                                      updatedValues[indexToUpdate].copyWith(
                                        value: newValue,
                                      );
                                } else {
                                  updatedValues.add(
                                    IndicatorValue(
                                      indicatorId: indicator.id!,
                                      value: newValue,
                                    ),
                                  );
                                }
                                context
                                    .read<CreatePropertyIndicatorsBloc>()
                                    .add(
                                      AddIndicatorEvent(
                                        indicators:
                                            CreatePropertyIndicatorsState(
                                              indicators: updatedValues,
                                            ),
                                      ),
                                    );
                              },
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
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
                            id: item!.id.toString(),
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
}

