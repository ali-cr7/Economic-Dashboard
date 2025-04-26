import 'package:economic_team_desktop/presentation/requests/widgets/drop_down_field.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/number_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyDescriptionWidget extends StatefulWidget {
  const PropertyDescriptionWidget({super.key});

  @override
  State<PropertyDescriptionWidget> createState() =>
      _PropertyDescriptionWidgetState();
}

class _PropertyDescriptionWidgetState extends State<PropertyDescriptionWidget> {
  final List<String> decorations = ['deluxe', 'modern', 'classic'];
  final List<String> kitchenTypes = ['western', 'open', 'closed'];
  final List<String> flooringTypes = ['granite', 'marble', 'wood'];
  final List<String> paintingTypes = ['regular', 'matte', 'glossy'];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Property descriptions:',
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
        Row(
          children: [
            Column(
              spacing: 22.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NumberPicker(
                  label: 'Space:',
                  value: 350, // int.tryParse(state.area) ?? 350,
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdateAreaEvent(area: val.toString()),
                  // ),
                  suffix: 'm²',
                ),
                NumberPicker(
                  label: 'Number of rooms:',
                  value: 4, //int.tryParse(state.numberOfRooms) ?? 4,
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdateNumberOfRoomsEvent(numberOfRooms: val.toString()),
                  // ),
                ),
                NumberPicker(
                  label: 'Number of bathrooms:',
                  value: 2, // int.tryParse(state.numberOfBathRooms) ?? 2,
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdateNumberOfBathroomsEvent(
                  //     numberOfBathrooms: val.toString(),
                  //   ),
                  // ),
                ),

                DropdownField(
                  label: 'Flooring type:',
                  items: flooringTypes,
                  selectedValue: 'granite',
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdateFlooringTypeEvent(flooringType: val),
                  // ),
                ),
                NumberPicker(
                  label: 'Property age:',
                  value: 2, // int.tryParse(state.propertyAge) ?? 2,
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdatePropertyAgeEvent(propertyAge: val.toString()),
                  // ),
                  suffix: 'year',
                ),
              ],
            ),
            Column(
              spacing: 22.h,
              children: [
                DropdownField(
                  label: 'Decoration:',
                  items: decorations,
                  selectedValue: 'deluxe',
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdateDecorationEvent(decoration: val),
                  // ),
                ),
                DropdownField(
                  label: 'Kitchen type:',
                  items: kitchenTypes,
                  selectedValue: 'western',
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdateKitchenTypeEvent(kitchenType: val),
                  // ),
                ),

                NumberPicker(
                  label: 'Overlook from 10:',
                  value: 4, // int.tryParse(state.overlookFrom) ?? 4,
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdateOverlookFromEvent(overlookFrom: val.toString()),
                  // ),
                ),
                NumberPicker(
                  label: 'Balcony size:',
                  value: 100, // int.tryParse(state.balconySize) ?? 100,
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdateBalconySizeEvent(balconySize: val.toString()),
                  // ),
                  suffix: 'm²',
                ),
                DropdownField(
                  label: 'Painting type:',
                  items: paintingTypes,
                  selectedValue: 'regular',
                  onChanged: (p0) {},
                  // (val) => context.read<SalePropertyBloc>().add(
                  //   UpdatePaintingTypeEvent(paintingType: val),
                  // ),
                ),
              ],
            ),
          ],
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
    //           padding: const EdgeInsets.all(12.0),
    //           child: Text(
    //             'Property descriptions:',
    //             style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 15,
    //               fontFamily: 'Inter',
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //         ),
    //         NumberPicker(
    //           label: 'Space:',
    //           value: int.tryParse(state.area) ?? 350,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdateAreaEvent(area: val.toString()),
    //               ),
    //           suffix: 'm²',
    //         ),
    //         NumberPicker(
    //           label: 'Number of rooms:',
    //           value: int.tryParse(state.numberOfRooms) ?? 4,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdateNumberOfRoomsEvent(numberOfRooms: val.toString()),
    //               ),
    //         ),
    //         NumberPicker(
    //           label: 'Number of bathrooms:',
    //           value: int.tryParse(state.numberOfBathRooms) ?? 2,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdateNumberOfBathroomsEvent(
    //                   numberOfBathrooms: val.toString(),
    //                 ),
    //               ),
    //         ),
    //         NumberPicker(
    //           label: 'Property age:',
    //           value: int.tryParse(state.propertyAge) ?? 2,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdatePropertyAgeEvent(propertyAge: val.toString()),
    //               ),
    //           suffix: 'year',
    //         ),
    //         DropdownField(
    //           label: 'Decoration:',
    //           items: decorations,
    //           selectedValue: state.decoration,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdateDecorationEvent(decoration: val),
    //               ),
    //         ),
    //         DropdownField(
    //           label: 'Kitchen type:',
    //           items: kitchenTypes,
    //           selectedValue: state.kitchenType,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdateKitchenTypeEvent(kitchenType: val),
    //               ),
    //         ),
    //         DropdownField(
    //           label: 'Flooring type:',
    //           items: flooringTypes,
    //           selectedValue: state.flooringType,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdateFlooringTypeEvent(flooringType: val),
    //               ),
    //         ),
    //         NumberPicker(
    //           label: 'Overlook from 10:',
    //           value: int.tryParse(state.overlookFrom) ?? 4,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdateOverlookFromEvent(overlookFrom: val.toString()),
    //               ),
    //         ),
    //         NumberPicker(
    //           label: 'Balcony size:',
    //           value: int.tryParse(state.balconySize) ?? 100,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdateBalconySizeEvent(balconySize: val.toString()),
    //               ),
    //           suffix: 'm²',
    //         ),
    //         DropdownField(
    //           label: 'Painting type:',
    //           items: paintingTypes,
    //           selectedValue: state.paintingType,
    //           onChanged:
    //               (val) => context.read<SalePropertyBloc>().add(
    //                 UpdatePaintingTypeEvent(paintingType: val),
    //               ),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
