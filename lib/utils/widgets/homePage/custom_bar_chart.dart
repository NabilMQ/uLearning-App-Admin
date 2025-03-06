import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({
    super.key,
    required this.title,
    this.xData,
    this.yData,
  });
  
  final String title;
  final List <String>? xData;
  final List <double>? yData;

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            widget.title,
            style: context.textTheme.titleLarge?.apply(
              color: context.colorScheme.primary
            ),
          ),
      
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              child: Builder(
                builder: (context) {

                  if (widget.xData == null || widget.xData!.isEmpty || widget.yData == null || widget.yData!.isEmpty) {
                    return Center(
                      child: Text(
                        "No Data",
                        style: context.textTheme.titleSmall?.apply(
                          color: context.colorScheme.primary.withValues(
                            alpha: 0.8,
                          ),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    );
                  }

                  return BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        enabled: false,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: (group) => Colors.transparent,
                          tooltipPadding: EdgeInsets.zero,
                          tooltipMargin: 8,
                          getTooltipItem: (
                            BarChartGroupData group,
                            int groupIndex,
                            BarChartRodData rod,
                            int rodIndex,
                          ) {
                            return BarTooltipItem(
                              rod.toY.round().toString(),
                              context.textTheme.bodyLarge!.apply(
                                color: context.colorScheme.primary,
                              ),
                            );
                          },
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                widget.xData!.elementAt(value.toInt()).toString(),
                                style: context.textTheme.bodyLarge!.apply(
                                  color: context.colorScheme.primary,
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: List.generate(widget.xData!.length, (index) {
                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: widget.yData!.elementAt(index),
                              color: context.colorScheme.primary
                            )
                          ],
                          showingTooltipIndicators: [0],
                        );
                      }),
                      gridData: const FlGridData(show: false),
                      alignment: BarChartAlignment.spaceAround,
                      maxY: ((widget.yData!.reduce(max) / (pow(10, max(1, widget.yData!.reduce(max).toString().length - 1)))).ceilToDouble() * pow(10, max(1, widget.yData!.reduce(max).toString().length - 1))),
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}