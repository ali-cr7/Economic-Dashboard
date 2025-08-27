import 'package:economic_team_desktop/data/models/request_details_response/data.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/financial_information.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/location_info.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_and_contract.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_description.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyUserInformation extends StatelessWidget {
  const PropertyUserInformation({
    super.key,
    required this.item,
  });

  final RequestData? item;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      children: [
        SaleEstateContainer(
          height: 550.h,
          //  width: 700.w,
          child: PropertyDescriptionWidget(
            balconySize:
                int.tryParse(
                  item!.balconySize!.split('.')[0] ,
                ) ?? 0,
            decoration: item!.decoration ?? " ",
            flooringType: item!.flooringType ?? " ",
            kitchenType: item!.kitchenType ?? " ",
            numberOfBathrooms: item!.numberOfBathrooms ?? 0,
            numberOfRooms: item!.numberOfRooms ?? 0,
            overlookFrom: item!.overlookFrom ?? 0,
            paintingType: item!.paintingType ?? " ",
            propertyAge: item!.propertyAge ?? 0,
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
                    payWay: item!.payWay!,
                  ),
                ),
                SaleEstateContainer(
                  width: 290.w,
                  height: 270.h,
                  child: ProertyAndContract(
                    propertyType: item!.propertyType!,
                  ),
                ),
              ],
            ),
            SaleEstateContainer(
              //width: 390.w,
              height: 270.h,
              child: LoactionInformation(
                loaction: item!.exactPosition!,
                state: item!.state!,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

