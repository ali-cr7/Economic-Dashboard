import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/economy_study.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/financial_information.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/location_info.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/negotiation_box.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_and_contract.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_description.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_images.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_type_option.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestDetailsView extends StatelessWidget {
  const RequestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HomeHeader(title: 'Request Details'),
        ),

        SizedBox(height: 20.h),
        CustomDivider(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  spacing: 20.w,
                  children: [
                    SaleEstateContainer(
                      height: 550.h,
                      //  width: 700.w,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: PropertyDescriptionWidget(),
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
                              child: FinancialInformation(),
                            ),
                            SaleEstateContainer(
                              width: 290.w,
                              height: 270.h,
                              child: ProertyAndContract(),
                            ),
                          ],
                        ),
                        SaleEstateContainer(
                          //width: 390.w,
                          height: 270.h,
                          child: LoactionInformation(),
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
                      //  width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: PropertyImagesUploader(
                          isPropertyDocuments: true,
                          title: "Property documents",
                          maxImages: 8,
                        ),
                      ),
                    ),
                    SaleEstateContainer(
                      width: 440.w,
                      height: 580.h,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: PropertyImagesUploader(
                          isIdImages: true,
                          title: 'id images (2 faces):',
                          maxImages: 2,
                        ),
                      ),
                    ),
                    SaleEstateContainer(
                      width: 440.w,
                      height: 580.h,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: PropertyImagesUploader(),
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
                        SaleEstateContainer(
                          width: 605.h,
                          height: 148.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                  'notice notice notice notice notice notice notice notice v notice notice v notice v vnotice,.',
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
                        SaleEstateContainer(
                          width: 605.h,
                          height: 148.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                  'notice notice notice notice notice notice notice notice v notice notice v notice v vnotice,.',
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
                    EconomyStudySection(),
                    SizedBox(height: 16),
                    SimpleEconomyStudySection(),
                  ],
                ),
              ),
            ],
          ),
        ),

        //    CustomDivider(),

        //    CustomDivider(),
        //

        // SaleEstateContainer(
        // height:280.h,
        // width: 582.w,
        // child:Column(children: [

        // ],) ,)
      ],
    );
  }
}
