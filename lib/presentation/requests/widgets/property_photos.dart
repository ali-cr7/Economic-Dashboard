import 'package:economic_team_desktop/data/models/request_details_response/data.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_images.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProprertyPhotos extends StatelessWidget {
  const ProprertyPhotos({
    super.key,
    required this.item,
  });

  final RequestData? item;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  item!.propertyDocument, // Pass your API response here
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
                  item!.idImage, // Pass your API response here
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
                  item!.propertyImage, // Pass your API response here
            ),
          ),
        ),
      ],
    );
  }
}
