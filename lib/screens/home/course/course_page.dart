import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_admin/blocs/courseListBloc/course_list_bloc.dart';
import 'package:ulearning_app_admin/blocs/courseListBloc/course_list_events.dart';
import 'package:ulearning_app_admin/blocs/courseListBloc/course_list_states.dart';
import 'package:ulearning_app_admin/screens/status/error_page.dart';
import 'package:ulearning_app_admin/screens/status/initializing_page.dart';
import 'package:ulearning_app_admin/screens/status/loading_page.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';

import 'package:ulearning_app_admin/utils/widgets/global/custom_button.dart';
import 'package:ulearning_app_admin/utils/widgets/global/no_data.dart';
import 'package:ulearning_app_admin/utils/widgets/homePage/custom_bar_chart.dart';

import 'package:ulearning_app_admin/utils/widgets/homePage/course/course_table_body.dart';
import 'package:ulearning_app_admin/utils/widgets/homePage/course/course_table_head.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  final CoursesListBloc _coursesTypeListBloc = CoursesListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <CoursesListBloc, CoursesListStates> (
      bloc: _coursesTypeListBloc..add(GetCourseListEvent()),
      builder: (context, state) {
        if (state.apiStatus == ApiStatus.error) {
          return ErrorPage();
        }
        
        if (state.apiStatus == ApiStatus.processing) {
          return LoadingPage();
        }

        if (state.apiStatus == ApiStatus.idle) {
          return InitializingPage();
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Course Data",
                      style: context.textTheme.displaySmall?.apply(
                        color: context.colorScheme.primary
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.screenWidth,
                    height: context.screenHeight / 2,
                    child: Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: CustomBarChart(
                            title: "Best Selling Course",
                          ),
                        ),
                    
                        Expanded(
                          child: CustomBarChart(
                            title: "Most Popular Course",
                          ),
                        ),
                      ],
                    ),
                  ),
          
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 180,
                      child: CustomButton(
                        text: "New Course",
                        isPrimary: true,
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ),
                  
                  Column(
                    children: [
                      CourseTableHead(),

                      Builder(
                        builder: (context) {
                          if (state.courseList == null || state.courseList!.courses!.isEmpty) {
                            return NoDataWidget();
                          }

                          return Column(
                            children: List.generate(state.courseList!.courses!.length, (index) {
                              return CourseTableBody(
                                course: state.courseList!.courses!.elementAt(index),
                              );
                            }),
                          );
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}