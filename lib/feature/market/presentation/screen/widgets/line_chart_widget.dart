
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/global/dimensions.dart';
import '../../../../../core/theming/app_colors_extension.dart';
class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsExtension>()!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: colors.btnTextColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$34,678.23',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32.font,
                        color: Color(0xff152C07),
                      ),
                    ),
                    Text(
                      '/ 1 BTC',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.font,
                        color: colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        size: 16,
                        color: colors.btnTextColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '15%',
                        style: TextStyle(
                          color: colors.btnTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 350,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 20),
                        FlSpot(1, 40),
                        FlSpot(2, 30),
                        FlSpot(3, 60),
                        FlSpot(4, 50),
                        FlSpot(5, 70),
                        FlSpot(6, 40),
                      ],

                      isCurved: true,
                      color: colors.primary,
                      barWidth: 2,
                      preventCurveOverShooting: true,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [colors.primary, Color(0xffE6E6E6)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      dotData: FlDotData(show: true),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                    leftTitles: AxisTitles(),

                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,

                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          const months = [
                            "00.00",
                            "04.00",
                            "08.00",
                            "12.00",
                            "16.00",
                            "20.00",
                            "24.00",
                          ];
                          return Text(months[value.toInt()]);
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  minY: 0,
                  maxY: 80,
                  minX: 0,
                  maxX: 6,
                ),
              ),
            ),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 32,
                  width: 46,
                  decoration: BoxDecoration(
                    color: colors.btnTextColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '1 h',
                      style: TextStyle(fontSize: 12.font, color: colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 32,
                  width: 46,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '1 d',
                      style: TextStyle(
                        fontSize: 12.font,
                        color: colors.btnTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 32,
                  width: 46,
                  decoration: BoxDecoration(
                    color: colors.btnTextColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '1 w',
                      style: TextStyle(fontSize: 12.font, color: colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 32,
                  width: 46,
                  decoration: BoxDecoration(
                    color: colors.btnTextColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '1 h',
                      style: TextStyle(fontSize: 12.font, color: colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 32,
                  width: 46,
                  decoration: BoxDecoration(
                    color: colors.btnTextColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '1 m',
                      style: TextStyle(fontSize: 12.font, color: colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 32,
                  width: 46,
                  decoration: BoxDecoration(
                    color: colors.btnTextColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '1 y',
                      style: TextStyle(fontSize: 12.font, color: colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}