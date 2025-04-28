import 'package:economic_team_desktop/presentation/auth/widgets/custom_buttom.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleEconomyStudySection extends StatefulWidget {
  const SimpleEconomyStudySection({super.key});

  @override
  State<SimpleEconomyStudySection> createState() =>
      _SimpleEconomyStudySectionState();
}

class _SimpleEconomyStudySectionState extends State<SimpleEconomyStudySection> {
  String paymentType = 'Bank Card';
  final TextEditingController negotiationOfferController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SaleEstateContainer(
      height: 400.h,
      width: 300.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "economy study:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: negotiationOfferController,
              decoration: InputDecoration(
                labelText: "negotiation offer:",
                labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: DropdownField(
                label: "payment type:",
                items: ['Bank Card', 'Cash', 'Installment'],
                selectedValue: paymentType,
                onChanged: (value) {
                  setState(() {
                    paymentType = value;
                  });
                },
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 80.0.w),
                child: Container(
                  width: 90.w,
                  height: 35.26.h,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, 1.00),
                      end: Alignment(1.00, 0.00),
                      colors: [
                        const Color(0xFF836BFD),
                        const Color(0xFF6855CA),
                        const Color(0xFF5B4AB0),
                        const Color(0xFF4E3F97),
                      ],
                    ).withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
