import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/number_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinancialInformation extends StatelessWidget {
  const FinancialInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> payWays = [
      'regular',
      'matte',
      'glossy',
    ]; // Consider moving to constants

    return Column(
      spacing: 22,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(
            'Financial information:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        NumberPicker(
          label: 'Expected price:',
          value:350, //int.tryParse(state.price) ?? 350,
          onChanged: (p0) {
            
          },
              // (val) => context.read<SalePropertyBloc>().add(
              //   UpdatePriceEvent(price: val.toString()),
              // ),
          suffix: '\$',
        ),
        DropdownField(
          label: 'Pay Way:',
          items: payWays,
          selectedValue:'glossy',
          onChanged: 
          (p0) {
            
          },
              // (val) => context.read<SalePropertyBloc>().add(
              //   UpdatePayWayEvent(payWay: val),
              // ),
        ),
      ],
    );
    // BlocBuilder<SalePropertyBloc, SalePropertyState>(
    //   builder: (context, state) {
    //     return Column(
    //       spacing: 22,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(left: 12.0, top: 12.0),
    //           child: Text(
    //             'Financial information:',
    //             style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 15,
    //               fontFamily: 'Inter',
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //         ),
    //         NumberPicker(
    //           label: 'Expected price:',
    //           value: int.tryParse(state.price) ?? 350,
    //           onChanged: (val) => context.read<SalePropertyBloc>().add(
    //                 UpdatePriceEvent(price: val.toString()),
    //               ),
    //           suffix: '\$',
    //         ),
    //         DropdownField(
    //           label: 'Pay Way:',
    //           items: payWays,
    //           selectedValue: state.payWay,
    //           onChanged: (val) => context.read<SalePropertyBloc>().add(
    //                 UpdatePayWayEvent(payWay: val),
    //               ),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
