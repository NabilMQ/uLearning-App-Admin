import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_admin/blocs/courseTypeListBloc/course_type_list_bloc.dart';
import 'package:ulearning_app_admin/blocs/courseTypeListBloc/course_type_list_events.dart';
import 'package:ulearning_app_admin/blocs/courseTypeListBloc/course_type_list_states.dart';
import 'package:ulearning_app_admin/screens/status/initializing_page.dart';
import 'package:ulearning_app_admin/screens/status/error_page.dart';
import 'package:ulearning_app_admin/screens/status/loading_page.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';
import 'package:ulearning_app_admin/utils/short/build_context.dart';
import 'package:ulearning_app_admin/utils/widgets/global/custom_button.dart';
import 'package:ulearning_app_admin/utils/widgets/global/no_data.dart';
import 'package:ulearning_app_admin/utils/widgets/homePage/courseType/course_type_table_body.dart';
import 'package:ulearning_app_admin/utils/widgets/homePage/courseType/course_type_table_head.dart';
import 'package:ulearning_app_admin/utils/widgets/homePage/custom_bar_chart.dart';

class CourseTypePage extends StatefulWidget {
  const CourseTypePage({super.key});

  @override
  State<CourseTypePage> createState() => _CourseTypePageState();
}

class _CourseTypePageState extends State<CourseTypePage> {
  
  final CoursesTypeListBloc _coursesTypeListBloc = CoursesTypeListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <CoursesTypeListBloc, CoursesTypeListStates> (
      bloc: _coursesTypeListBloc..add(GetCoursesTypeListEvent()),
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
                      "Course Type Data",
                      style: context.textTheme.displaySmall?.apply(
                        color: context.colorScheme.primary
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.screenWidth,
                    height: context.screenHeight / 2,
                    child: CustomBarChart(
                      title: "Most Course per Course Type",
                      xData: state.coursesTypeList!.coursesType!.map((el) => el.title!).toList(),
                      yData: state.coursesTypeList!.coursesType!.map((el) => el.count.toDouble()).toList(),
                    ),
                  ),
        
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 180,
                      child: CustomButton(
                        text: "New Course Type",
                        isPrimary: true,
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ),
                  
                  Column(
                    children: [
                      CourseTypeTableHead(),
                  
                      Builder(
                        builder: (context) {
                          if (state.coursesTypeList == null || state.coursesTypeList!.coursesType!.isEmpty) {
                            return NoDataWidget();
                          }

                          return Column(
                            children: List.generate(state.coursesTypeList!.coursesType!.length, (index) {
                              return CourseTypeTableBody(
                                courseType: state.coursesTypeList!.coursesType!.elementAt(index),
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
          )
        );
      }
    );
  }
}