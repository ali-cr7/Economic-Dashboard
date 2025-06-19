import 'package:economic_team_desktop/data/models/request_details_response/data.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminNotePart extends StatelessWidget {
  const AdminNotePart({
    super.key,
    required this.item,
  });

  final RequestData? item;

  @override
  Widget build(BuildContext context) {
    return SaleEstateContainer(
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
              item!.noteAdmin ?? "empty",
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
    );
  }
}