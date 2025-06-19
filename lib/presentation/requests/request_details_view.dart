import 'package:economic_team_desktop/buisness_logic/create%20economic%20study%20bloc/create_economic_study_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20economic%20study%20bloc/send_economic_study_bloc.dart';
import 'package:economic_team_desktop/data/models/request_details_response/data.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/admin_note_part.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/details_shimmer.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/economy_Study_part.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/economy_study.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/financial_information.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/label_widget.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/location_info.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/negotiation_box.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_and_contract.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_description.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_images.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_indicators.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_photos.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_user_inforamtion.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/user_negotiation_part.dart';
import 'package:economic_team_desktop/utility/dialogs_snackBar.dart';
import 'package:economic_team_desktop/utility/elevated_button_widget.dart';
import 'package:economic_team_desktop/utility/somthing_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RequestDetailsView extends StatelessWidget {
  const RequestDetailsView({
    super.key,
    required this.agreedNegotiationStatus,
    required this.acceptAdmin,
    required this.requestId,
    required this.agreedNegotiationText,
    required this.agreedNegotiationId, required this.byWhom, required this.propertyForSaleId,
  });
  final String? agreedNegotiationStatus;
  final String? agreedNegotiationText;
  final int? agreedNegotiationId;
  final String acceptAdmin;
  final String requestId;
  final String byWhom;
   final String propertyForSaleId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: BlocListener<SendEconomicStudyBloc, SendEconomicStudyState>(
        listener: (context, state) {
          if (state is SendEconomicStudyLoading) {
            EasyLoading.show(status: 'loading...');
          }
          if (state is SendEconomicStudyStatus) {
            EasyLoading.dismiss();
            EasyLoading.showToast(state.helperResponse.fullBody!['message']);
            context.read<PropertyRequestDetailsBloc>().add(
              GetPropertiesRequestDetailsEvent(requestId: requestId),
            );
          } else if (state is SendEconomicFailure) {
            EasyLoading.dismiss();

            EasyLoading.showToast(state.errMessage.response);
            //  showServerError: false,
          }
        },
        child: Column(
          children: [
            // HomeHeader(title: ''),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    'Request Details',
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 70),
                      fontSize: 40.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40.h),
            //  CustomDivider(),
            BlocBuilder<
              PropertyRequestDetailsBloc,
              PropertyRequestDetailsState
            >(
              builder: (context, state) {
                if (state is PropertyRequestDetailsSuccses) {
                  final item = state.requestDetailsResponse.data;
                  final negotiationMode = context.select(
                    (CreateEconomicStudyBloc bloc) =>
                        bloc.state.negotiationMode,
                  );

                  return Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: LabelWidget(text: 'Property Information'),
                        ),
                        SliverToBoxAdapter(
                          child: PropertyUserInformation(item: item),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 16)),
                        SliverToBoxAdapter(child: ProprertyPhotos(item: item)),
                        SliverToBoxAdapter(child: SizedBox(height: 16)),

                        /// 🎯 Selection Chips
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              children: [
                                Text(
                                  "Decision: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10.w),
                                ChoiceChip(
                                  label: Text("Accept"),
                                  selected: negotiationMode == "accept",
                                  onSelected: (selected) {
                                    if (selected) {
                                      context
                                          .read<CreateEconomicStudyBloc>()
                                          .add(
                                            UpdateNegotiationModeEvent(
                                              negotiationMode: "accept",
                                            ),
                                          );
                                    }
                                  },
                                ),
                                SizedBox(width: 8.w),
                                ChoiceChip(
                                  label: Text("Negotiation"),
                                  selected: negotiationMode == "negotiation",
                                  onSelected: (selected) {
                                    if (selected) {
                                      context
                                          .read<CreateEconomicStudyBloc>()
                                          .add(
                                            UpdateNegotiationModeEvent(
                                              negotiationMode: "negotiation",
                                            ),
                                          );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 16)),

                        /// 📝 Admin/User Notes
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomDivider(),
                              SizedBox(height: 16),
                              Row(
                                spacing: 20.w,
                                children: [
                                  if (acceptAdmin == 'مرفوض')
                                    AdminNotePart(item: item),
                                  UserNegotiationPart(
                                    agreedNegotiationStatus:
                                        agreedNegotiationStatus,
                                    agreedNegotiationText:
                                        agreedNegotiationText,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              //  if (agreedNegotiationText!.isNotEmpty)
                              CustomDivider(),
                              SizedBox(height: 8),

                              /// 💼 Based on selected mode
                              if (negotiationMode == "accept" &&
                                  agreedNegotiationStatus !=
                                      'تم الرفض من قبل المستخدد') ...[
                                EconomyStudyPart(
                                  propertyForSaleId:propertyForSaleId ,
                                  byWhom:byWhom ,
                                  item: item,
                                  agreedNegotiationStatus:
                                      agreedNegotiationStatus,
                                  requestId: requestId,
                                  agreedNegotiationId: agreedNegotiationId,
                                ),
                              ] else if (negotiationMode == "negotiation" &&
                                  agreedNegotiationStatus ==
                                      "تم قبول الطلب من قبل المستخدم") ...[
                                EconomyStudyPart(
                                  propertyForSaleId: propertyForSaleId ,
                                  byWhom: byWhom,
                                  item: item,
                                  agreedNegotiationStatus:
                                      agreedNegotiationStatus,
                                  requestId: requestId,
                                  agreedNegotiationId: agreedNegotiationId,
                                ),
                              ] else if (negotiationMode == "negotiation") ...[
                                NegotiationBox(
                                  negotiationId: agreedNegotiationId ?? 0,
                                  propertyId: item?.id.toString() ?? '',
                                ),
                              ],

                              SizedBox(height: 16.h),

                              if (state
                                      .requestDetailsResponse
                                      .hasEconomicData ==
                                  true)
                                PropertyIndicators(item: item!),

                              SizedBox(height: 16.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: SomethingWrongWidget(
                      title: "No Questions found !",
                      svgPath: 'assets/images/search.svg',
                      elevatedButtonWidget: ElevatedButtonWidget(
                        title: "Refresh",
                        onPressed: () {
                          context.read<PropertyRequestDetailsBloc>().add(
                            GetPropertiesRequestDetailsEvent(
                              requestId: requestId,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
