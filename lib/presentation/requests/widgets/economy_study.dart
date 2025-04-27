import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/number_picker.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EconomyStudySection extends StatefulWidget {
  const EconomyStudySection({super.key});

  @override
  State<EconomyStudySection> createState() => _EconomyStudySectionState();
}

class _EconomyStudySectionState extends State<EconomyStudySection> {
  String negotiationMode = 'negotiation';
  String investmentMode = 'Balanced';
  String propertyManagement = 'renting';

  int buyingPrice = 7800;
  int expectedPrice = 9000;
  int totalExpectedTaxes = 1000;
  int chancePrice = 300;
  int numberOfChances = 5000;
  int investmentTime = 90;
  int profitPercent = 12;

  DateTime incomingTime = DateTime(2025, 12, 9);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: incomingTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != incomingTime) {
      setState(() {
        incomingTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SaleEstateContainer(
      width: 1200.w,
      height: 350.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          spacing: 20.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, bottom: 5.h),
              child: Text(
                "economy study:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              spacing: 20.w,
              children: [
                DropdownField(
                  label: "negotiation mode:",
                  items: ['negotiation', 'fixed'],
                  selectedValue: negotiationMode,
                  onChanged: (value) {
                    setState(() {
                      negotiationMode = value;
                    });
                  },
                ),
                NumberPicker(
                  label: "baying price:",
                  value: buyingPrice,
                  onChanged: (value) {
                    setState(() {
                      buyingPrice = value;
                    });
                  },
                  suffix: '\$',
                ),
                NumberPicker(
                  label: "number of chances:",
                  value: numberOfChances,
                  onChanged: (value) {
                    setState(() {
                      numberOfChances = value;
                    });
                  },
                ),
                NumberPicker(
                  label: "expected price:",
                  value: expectedPrice,
                  onChanged: (value) {
                    setState(() {
                      expectedPrice = value;
                    });
                  },
                  suffix: '\$',
                ),
              ],
            ),
            Row(
              spacing: 20.w,
              children: [
                NumberPicker(
                  label: "total expected taxes:",
                  value: totalExpectedTaxes,
                  onChanged: (value) {
                    setState(() {
                      totalExpectedTaxes = value;
                    });
                  },
                  suffix: '\$',
                ),
                NumberPicker(
                  label: "chance price:",
                  value: chancePrice,
                  onChanged: (value) {
                    setState(() {
                      chancePrice = value;
                    });
                  },
                  suffix: '\$',
                ),
                DropdownField(
                  label: "investment mode:",
                  items: ['Balanced', 'Aggressive', 'Safe'],
                  selectedValue: investmentMode,
                  onChanged: (value) {
                    setState(() {
                      investmentMode = value;
                    });
                  },
                ),
                NumberPicker(
                  label: "profit percent:",
                  value: profitPercent,
                  onChanged: (value) {
                    setState(() {
                      profitPercent = value;
                    });
                  },
                  suffix: '%',
                ),
              ],
            ),
            Row(
              spacing: 20.w,
              children: [
                NumberPicker(
                  label: "investment time:",
                  value: investmentTime,
                  onChanged: (value) {
                    setState(() {
                      investmentTime = value;
                    });
                  },
                  suffix: 'days',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    spacing: 10.w,
                    children: [
                      Text(
                        "incoming time:",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 107.w,
                        height: 26.63.h,
                        child: OutlinedButton(
                          onPressed: () => _selectDate(context),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "${incomingTime.year}-${incomingTime.month}-${incomingTime.day}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                DropdownField(
                  label: "property management:",
                  items: ['renting', 'selling'],
                  selectedValue: propertyManagement,
                  onChanged: (value) {
                    setState(() {
                      propertyManagement = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
