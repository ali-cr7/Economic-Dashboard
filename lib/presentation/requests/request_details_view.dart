import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/economy_study.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/financial_information.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/location_info.dart';
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
        Row(
          spacing: 20.w,
          children: [
            SaleEstateContainer(
              height: 440,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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

        Row(
          children: [
            SaleEstateContainer(
              height: 280,
              child: PropertyImagesUploader(
                isPropertyDocuments: true,
                title: "Property documents",
                maxImages: 8,
              ),
            ),
            SaleEstateContainer(
              height: 215,
              child: PropertyImagesUploader(
                isIdImages: true,
                title: 'id images (2 faces):',
                maxImages: 2,
              ),
            ),
            SaleEstateContainer(height: 280, child: PropertyImagesUploader()),
          ],
        ),
        CustomDivider(),
        Row(
          spacing: 20.w,
          children: [
            SaleEstateContainer(
              width: 605,
              height: 148,
              child: Column(
                children: [
                  Text(
                    'Director notice:',
                    style: TextStyle(
                      color: const Color(0xFFC21932),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'notice notice notice notice notice notice notice notice v notice notice v notice v vnotice,.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SaleEstateContainer(
              width: 605,
              height: 148,
              child: Column(
                children: [
                  Text(
                    'Director notice:',
                    style: TextStyle(
                      color: const Color(0xFFC21932),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'notice notice notice notice notice notice notice notice v notice notice v notice v vnotice,.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
             CustomDivider(),
        EconomyStudy(),
SaleEstateContainer(
height:280.h,
width: 582.w,
child:Column(children: [
  
],) ,)

      ],
    );
  }
}
