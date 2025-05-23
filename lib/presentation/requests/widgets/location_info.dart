import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoactionInformation extends StatelessWidget {
  LoactionInformation({super.key, this.state = 'Tartous', this.loaction = ' '});
  final String state;
  final String loaction;
  TextEditingController loactionController = TextEditingController();

  final List<String> syrianStates = [
    'Damascus',
    'Rif Dimashq',
    'Aleppo',
    'Homs',
    'Hama',
    'Latakia',
    'Tartous',
    'Idlib',
    'Daraa',
    'As-Suwayda',
    'Deir ez-Zor',
    'Raqqa',
    'Al-Hasakah',
    'Quneitra',
  ];

  // String selectedSyrianStates = 'Damascus';

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(
            'Location information:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        // const SizedBox(height: 5),
        Expanded(
          child: DropdownField(
            label: 'state:',
            items: syrianStates,
            selectedValue: state,
            onChanged: (p0) {},
            // (val) => context.read<SalePropertyBloc>().add(
            //   UpdateStateEvent(state: val.toString()),
            // ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Text(
                  ' Description:',
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 100),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  width: 186.w,
                  height: 27.h,
                  child: TextField(
                    onChanged: (value) {
                      // context.read<SalePropertyBloc>().add(
                      //   UpdateExactPositionEvent(exactPosition: value.toString()),
                      // );
                    },
                    controller: loactionController,
                    cursorHeight: 16,
                    decoration: InputDecoration(
                      //  floatingLabelAlignment: Alignment.center,
                      contentPadding: EdgeInsets.only(top: 2.0, left: 3),
                      hintText: loaction,
                      hintStyle: TextStyle(
                        color: AppColors.black88,
                        fontSize: 12,
                      ),
                      // prefixIcon: Icon(icon, color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
