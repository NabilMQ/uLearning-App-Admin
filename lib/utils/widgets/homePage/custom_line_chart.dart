import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({
    super.key,
    required this.title,
    this.xData,
    this.yData,
  });
  
  final String title;
  final List <String>? xData;
  final List <double>? yData;

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
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
                  
                  return LineChart(
                    transformationConfig: FlTransformationConfig(
                      trackpadScrollCausesScale: true
                    ),
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 200),
                    LineChartData(
                      
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipColor: (touchedSpot) {
                            return context.colorScheme.onPrimary;
                          },
                        )
                      ),
                      gridData: FlGridData(
                        show: false,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 1 ,
                            getTitlesWidget:(value, meta) {
                              return Text(
                                widget.xData!.elementAt(value.toInt()),
                                style: context.textTheme.bodySmall!.apply(
                                  color: context.colorScheme.primary,
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: ((widget.yData!.reduce(max) / (pow(10, max(1, widget.yData!.reduce(max).toString().length - 1)))).ceilToDouble() * pow(10, max(1, widget.yData!.reduce(max).toString().length - 1))) / 4,
                            reservedSize: 22,
                            minIncluded: false,
                            maxIncluded: true,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toString(),
                                style: context.textTheme.bodySmall!.apply(
                                  color: context.colorScheme.primary,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border(
                          bottom: BorderSide(
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ),
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: ((widget.yData!.reduce(max) / (pow(10, max(1, widget.yData!.reduce(max).toString().length - 1)))).ceilToDouble() * pow(10, max(1, widget.yData!.reduce(max).toString().length - 1))),
                      lineBarsData: [
                        LineChartBarData(
                          curveSmoothness: 0.35,
                          spots: List.generate(widget.xData!.length, (index) {
                            return FlSpot(index.toDouble(), widget.yData!.elementAt(index));
                          }),
                          isCurved: true,
                          color: context.colorScheme.primary,
                          barWidth: 5,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(
                            show: false,
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            color: context.colorScheme.primary.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
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