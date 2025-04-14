import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class PriceChart extends StatelessWidget {
  final List<double> historicalPrices;

  const PriceChart({
    super.key,
    required this.historicalPrices,
  });

  @override
  Widget build(BuildContext context) {
    final dates = _generateDates();
    final isPositive7d = historicalPrices.reduce((a, b) => a + b) > 0;
    return Column(
      children: [
        SizedBox(
          width: 100.w,
          height: 300,
          child: AspectRatio(
            aspectRatio: 2,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: _bottomTitles(dates),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: _leftTitles,
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: historicalPrices.length.toDouble() - 1,
                minY: historicalPrices.reduce((a, b) => a < b ? a : b),
                maxY: historicalPrices.reduce((a, b) => a > b ? a : b),
                lineBarsData: [
                  LineChartBarData(
                    spots: historicalPrices.asMap().entries.map((e) {
                      return FlSpot(e.key.toDouble(), e.value);
                    }).toList(),
                    isCurved: true,
                    color: isPositive7d ? Colors.green : Colors.red,
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          isPositive7d
                              ? Colors.green.withOpacity(0.3)
                              : Colors.red.withOpacity(0.3),
                          Colors.transparent
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    dotData: const FlDotData(show: false),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '\$${spot.y.toStringAsFixed(8)}',
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Variação dos últimos 7 dias',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
        ),
      ],
    );
  }

  List<DateTime> _generateDates() {
    final now = DateTime.now();
    final startDate = now.subtract(Duration(days: 7));
    final totalHours = 7 * 24;
    final interval = totalHours / historicalPrices.length;

    return List.generate(historicalPrices.length, (index) {
      final hoursToAdd = interval * index;
      return startDate.add(Duration(minutes: (hoursToAdd * 60).toInt()));
    });
  }

  SideTitles _bottomTitles(List<DateTime> dates) => SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: _calculateDateInterval(dates.length),
        getTitlesWidget: (value, meta) {
          final index = value.toInt();
          if (index >= dates.length) return const SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              DateFormat('dd/MM').format(dates[index]),
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          );
        },
      );

  double _calculateDateInterval(int dataPoints) {
    if (dataPoints <= 7) return 1;
    if (dataPoints <= 30) return 5;
    if (dataPoints <= 100) return 10;
    return 20;
  }

  SideTitles get _leftTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: _calculatePriceInterval(),
        getTitlesWidget: (value, meta) {
          return Text(
            '\$${value.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          );
        },
      );

  double _calculatePriceInterval() {
    final maxPrice = historicalPrices.reduce((a, b) => a > b ? a : b);
    final minPrice = historicalPrices.reduce((a, b) => a < b ? a : b);
    final range = maxPrice - minPrice;

    if (range > 1000) return 500;
    if (range > 500) return 200;
    if (range > 100) return 50;
    if (range > 20) return 10;
    return 5;
  }
}
