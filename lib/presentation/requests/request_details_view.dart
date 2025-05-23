import 'package:economic_team_desktop/buisness_logic/property%20request%20details%20bloc/property_request_details_bloc.dart';
import 'package:economic_team_desktop/buisness_logic/send%20economic%20study%20bloc/send_economic_study_bloc.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/economy_study.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/financial_information.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/location_info.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/negotiation_box.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_and_contract.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_description.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_images.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/send_property_button.dart';
import 'package:economic_team_desktop/utility/dialogs_snackBar.dart';
import 'package:economic_team_desktop/utility/elevated_button_widget.dart';
import 'package:economic_team_desktop/utility/somthing_wrong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class RequestDetailsView extends StatelessWidget {
  const RequestDetailsView({
    super.key,
    required this.agreedNegotiationStatus,
    required this.acceptAdmin,
    required this.requestId,
    required this.agreedNegotiationText,
    required this.agreedNegotiationId,
  });
  final String? agreedNegotiationStatus;
  final String? agreedNegotiationText;
  final int? agreedNegotiationId;
  final String acceptAdmin;
  final String requestId;
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
            //  context.read()
            // DialogsWidgetsSnackBar.showSnackBarFromStatus(
            //   context: context,
            //   helperResponse: state.helperResponse,
            //   showServerError: true,
            // );
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

            SizedBox(height: 20.h),
            CustomDivider(),
            BlocBuilder<
              PropertyRequestDetailsBloc,
              PropertyRequestDetailsState
            >(
              builder: (context, state) {
                if (state is PropertyRequestDetailsLoading) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(25.0.sp),
                          child: DetailsShimmerItem(),
                        );
                      },
                    ),
                  );
                } else if (state is PropertyRequestDetailsSuccses) {
                  final item = state.requestDetailsResponse.data;
                  return Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Row(
                            spacing: 20.w,
                            children: [
                              SaleEstateContainer(
                                height: 550.h,
                                //  width: 700.w,
                                child: PropertyDescriptionWidget(
                                  balconySize:
                                      int.tryParse(
                                        item!.balconySize!.split('.')[0],
                                      )!,
                                  decoration: item.decoration!,
                                  flooringType: item.flooringType!,
                                  kitchenType: item.kitchenType!,
                                  numberOfBathrooms: item.numberOfBathrooms!,
                                  numberOfRooms: item.numberOfRooms!,
                                  overlookFrom: item.overlookFrom!,
                                  paintingType: item.paintingType!,
                                  propertyAge: item.propertyAge!,
                                  space:
                                      int.tryParse(item!.area!.split('.')[0])!,
                                ),
                              ),
                              Column(
                                spacing: 10.h,
                                children: [
                                  Row(
                                    spacing: 10.w,
                                    children: [
                                      SaleEstateContainer(
                                        width: 290.w,
                                        height: 270.h,
                                        child: FinancialInformation(
                                          expectedPrice:
                                              int.tryParse(
                                                item!.price!.split('.')[0],
                                              )!,
                                          payWay: item.payWay!,
                                        ),
                                      ),
                                      SaleEstateContainer(
                                        width: 290.w,
                                        height: 270.h,
                                        child: ProertyAndContract(
                                          propertyType: item.propertyType!,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SaleEstateContainer(
                                    //width: 390.w,
                                    height: 270.h,
                                    child: LoactionInformation(
                                      loaction: item.exactPosition!,
                                      state: item.state!,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 16)),
                        SliverToBoxAdapter(
                          child: Row(
                            spacing: 10.w,
                            children: [
                              SaleEstateContainer(
                                width: 440.w,
                                height: 580.h,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: PropertyImagesUploader(
                                    //isPropertyDocuments: true,
                                    title: "Property documents",
                                    maxImages: 8,
                                    images:
                                        item.propertyDocument, // Pass your API response here
                                  ),
                                ),
                              ),
                              SaleEstateContainer(
                                width: 440.w,
                                height: 580.h,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: PropertyImagesUploader(
                                    //  isIdImages: true,
                                    title: 'id images (2 faces):',
                                    maxImages: 2,
                                    images:
                                        item.idImage, // Pass your API response here
                                  ),
                                ),
                              ),
                              SaleEstateContainer(
                                width: 440.w,
                                height: 580.h,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: PropertyImagesUploader(
                                    images:
                                        item.propertyImage, // Pass your API response here
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 16)),
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomDivider(),
                              SizedBox(height: 16),
                              Row(
                                spacing: 20.w,
                                children: [
                                  if (acceptAdmin == 'مرفوض')
                                    SaleEstateContainer(
                                      width: 605.h,
                                      height: 148.w,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Director notice:',
                                              style: TextStyle(
                                                color: const Color(0xFFC21932),
                                                fontSize: 16.sp,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              item.noteAdmin ?? "empty",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (agreedNegotiationStatus ==
                                          'تم قبول الطلب من قبل المستخدم' ||
                                      agreedNegotiationStatus == 'معلق')
                                    SaleEstateContainer(
                                      width: 605.h,
                                      height: 148.w,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'negotiation offer:',
                                              style: TextStyle(
                                                color: const Color(0xFF27B055),
                                                fontSize: 16.sp,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              agreedNegotiationText!,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 16),
                              CustomDivider(),
                              SizedBox(height: 16),
                              EconomyStudySection(
                                initialBuyingPrice:
                                    item.economicEvaluation!.buyingPrice!
                                        .toDouble(),
                                initialChancePrice:
                                    item.economicEvaluation!.chancePrice!
                                        .toDouble(),
                                initialExpectedPrice:
                                    item.economicEvaluation!.expectedPrice!
                                        .toDouble(),
                                initialIncomingTime:
                                    item.economicEvaluation!.incomingTime!,
                                initialInvestmentMode:
                                    item.economicEvaluation!.investmentMode!,
                                initialInvestmentTime:
                                    item.economicEvaluation!.investmentTime!,
                                initialNumberOfChances:
                                    item.economicEvaluation!.numberOfChances!,
                                initialProfitPercent:
                                    item.economicEvaluation!.profitPercent!
                                        .toDouble(),
                                initialPropertyManagement:
                                    item
                                        .economicEvaluation!
                                        .propertyManagement!,
                                initialTotalExpectedTaxes:
                                    item.economicEvaluation!.totalExpectedTaxes!
                                        .toDouble(),
                                agreedNegotiationId: agreedNegotiationId!,
                                propertyForSaleId: item.id!,
                                requestFromLawyerId: item.id!,
                              ),
                              SizedBox(height: 16),
                              SimpleEconomyStudySection(
                                negotiationId:   item.economicEvaluation!.agreedNegotiation!.id?? 0,
                                propertyId: item.id.toString(),
                              ),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.center,
                                child: SendPropertyButton(

                                  requestId: item.id!,
                                  isCompleted:
                                      item.economicEvaluation!.profitPercent! !=
                                      0,
                                  isUserAccepted:
                                      agreedNegotiationStatus ==
                                      'تم قبول الطلب من قبل المستخدم',
                                  negotiationId: agreedNegotiationId!,
                                  propertyForSaleId: int.tryParse(requestId)!,
                                  requestFromLawyerId: int.tryParse(requestId)!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 90.h,
                    width: 90.w,

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

class DetailsShimmerItem extends StatelessWidget {
  const DetailsShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SaleEstateContainer(
          width: 1150.w,
          height: 95.h,
          child: SizedBox()!,
        ),
      ),
    );
  }
}
