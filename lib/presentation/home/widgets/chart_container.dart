import 'package:economic_team_desktop/data/models/staistics_chart_response/staistics_chart_response.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyChartContainer extends StatelessWidget {
  final StaisticsChartResponse items;

  const MyChartContainer({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    // List of month abbreviations
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

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
              padding: EdgeInsets.all(20.w),
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
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          // Display month abbreviations
                          if (value >= 1 && value <= 12) {
                            return Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Text(
                                months[value.toInt() - 1],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                            );
                          }
                          return const Text('');
                        },
                        reservedSize: 30.h,
                        interval: 1,
                      ),
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
                  maxX: 12,
                  minX: 0,
                  minY: 0,
                  maxY: 100,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(
                          1,
                          double.parse(
                            (items.data!.one ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          2,
                          double.parse(
                            (items.data!.two ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          3,
                          double.parse(
                            (items.data!.three ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          4,
                          double.parse(
                            (items.data!.four ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          5,
                          double.parse(
                            (items.data!.five ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          6,
                          double.parse(
                            (items.data!.six ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          7,
                          double.parse(
                            (items.data!.seven ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          8,
                          double.parse(
                            (items.data!.eight ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          9,
                          double.parse(
                            (items.data!.nine ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          10,
                          double.parse(
                            (items.data!.ten ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          11,
                          double.parse(
                            (items.data!.eleven ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
                        FlSpot(
                          12,
                          double.parse(
                            (items.data!.twelve ?? 0.0).toStringAsFixed(2),
                          ),
                        ),
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
