import 'package:flutter/material.dart';
import 'package:ulearning_app_admin/utils/constants/months.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/homePage/custom_line_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Home Page",
                style: context.textTheme.displaySmall?.apply(
                  color: context.colorScheme.primary
                ),
              ),
            ),
            
            Expanded(
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: CustomLineChart(
                      title: "Monthly Revenue",
                      xData: Months.month,
                      yData: [
                        23,
                        23,
                        12,
                        1,
                        23,
                        3,
                        6,
                        26,
                        33,
                        25,
                        32,
                        12,
                      ],
                    ),
                  ),
              
                  Expanded(
                    child: CustomLineChart(
                      title: "Yearly Revenue",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: CustomLineChart(
                      title: "Best Selling Course",
                    ),
                  ),
              
                  Expanded(
                    child: CustomLineChart(
                      title: "Most Popular Course",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}