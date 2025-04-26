import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/requests/widgets/request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HomeHeader(title: 'Requests'),
        ),

        SizedBox(height: 20.h),
        CustomDivider(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RequestsItem(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
