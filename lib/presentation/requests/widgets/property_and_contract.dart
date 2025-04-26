import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/property_type_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProertyAndContract extends StatelessWidget {
  const ProertyAndContract({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> conractTypes = [
      'Buying',
      'Investment',
    ]; // Consider moving to constants

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 24.h,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  'property & contract:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: PropertyTypeOption(
              groupValue: '',
              label: 'Apartment',
              onChanged: (value) {},
            ),
          ),
          DropdownField(
            label: 'Contract:',
            items: conractTypes,
            selectedValue: 'Buying',
            onChanged: (p0) {},
            // (val) => context.read<SalePropertyBloc>().add(
            //   UpdatePayWayEvent(payWay: val),
            // ),
          ),
        ],
      ),
    );
  }
}
