

import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/number_picker.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/sales_estate_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EconomyStudy extends StatelessWidget {
  const EconomyStudy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Economy Study')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SaleEstateContainer(
              height: 150.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    label: 'Negotiation Mode',
                    value: 1,
                    onChanged: (value) {},
                    suffix: 'negotiation',
                  ),
                  DropdownField(
                    label: 'Buying Price',
                    items: ['7800', '7900', '8000'],
                    selectedValue: '7800',
                    onChanged: (value) {},
                  ),
                  NumberPicker(
                    label: 'Total Expected Taxes',
                    value: 1000,
                    onChanged: (value) {},
                    suffix: '\$',
                  ),
                  NumberPicker(
                    label: 'Investment Time',
                    value: 90,
                    onChanged: (value) {},
                    suffix: 'days',
                  ),
                  DropdownField(
                    label: 'Property Management',
                    items: ['Renting', 'Selling'],
                    selectedValue: 'Renting',
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Number of Chances: 5000'),
                Text('Expected Price: 9000 \$'),
                Text('Profit Percent: 12%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
