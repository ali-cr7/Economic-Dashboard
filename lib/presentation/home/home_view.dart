import 'package:economic_team_desktop/gen/assets.gen.dart';
import 'package:economic_team_desktop/presentation/home/widgets/chart_container.dart';
import 'package:economic_team_desktop/presentation/home/widgets/currency_item.dart';
import 'package:economic_team_desktop/presentation/home/widgets/custom_serach_bar.dart';
import 'package:economic_team_desktop/presentation/home/widgets/divider.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_header.dart';
import 'package:economic_team_desktop/presentation/home/widgets/home_progress_row.dart';
import 'package:economic_team_desktop/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        child: Column(
          spacing: 10.h,
          children: [
            HomeHeader(title: 'Home',),
            CustomDivider(),
            


            Row(
              spacing: 10.w,
              children: [
            MyChartContainer()
              ,
                Container(
                  width: 288.w,
                  height: 550.83.h,
                  decoration: ShapeDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0.00, 1.00),
                      radius: 1.41,
                      colors: [
                        const Color(0x7F9A8AEC),
                        const Color(0xFF574E86),
                      ],
                    ).withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        color: const Color(0xFF826AFC),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      spacing: 20.h,
                      children: [
                        CurrencyItem(),
                        CurrencyItem(),
                        CurrencyItem(),
                        CurrencyItem(),
                        CurrencyItem(),
                        CurrencyItem(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: HomeProgressRow()),
          ],
        ),
      ),
    );
  }
}
