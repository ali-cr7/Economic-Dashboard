import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyChartContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800.44.w,
      height: 550.83.h,
      decoration: ShapeDecoration(
        gradient: RadialGradient(
          center: Alignment(0.00, 1.00),
          radius: 1.58,
          colors: [const Color(0x7F9A8AEC), const Color(0xFF574E86)],
        ).withOpacity(0.5),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: const Color(0xFF826AFC)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(40.w),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          );
                        },
                        reservedSize: 40.w,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minY: 0,
                  maxY: 70,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 70),
                        FlSpot(1, 60),
                        FlSpot(2, 50),
                        FlSpot(3, 40),
                        FlSpot(4, 30),
                        FlSpot(5, 20),
                        FlSpot(6, 10),
                      ],
                      isCurved: true,
                      color: Color(0xFF826AFC),
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 6,
                            color: Color(0xFF826AFC),
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF826AFC).withOpacity(0.3),
                            Color(0xFF574E86).withOpacity(0.1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Text(
              'success',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
