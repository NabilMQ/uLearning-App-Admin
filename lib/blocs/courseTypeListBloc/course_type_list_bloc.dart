import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_admin/blocs/courseTypeListBloc/course_type_list_events.dart';
import 'package:ulearning_app_admin/blocs/courseTypeListBloc/course_type_list_states.dart';
import 'package:ulearning_app_admin/utils/api/course_api.dart';
import 'package:ulearning_app_admin/utils/constants/global.dart';
import 'package:ulearning_app_admin/utils/entities/course_type_list.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';

class CoursesTypeListBloc extends Bloc <CoursesTypeListEvents, CoursesTypeListStates> {
  CoursesTypeListBloc() : super(CoursesTypeListStates()) {
    on <GetCoursesTypeListEvent> ((event, emit) async {
      emit(
        state.copyWith(
          apiStatus: ApiStatus.processing,
        )
      );
      
      try { 
        String response = await CourseAPI.getListCourseType(Global.storageService.getUserToken());

        if (response == "Something went wrong" || jsonDecode(response)["code"] != 200) {
          throw "Error";
        }

        emit(
          state.copyWith(
            coursesTypeList: CoursesTypeList.fromJson(jsonDecode(response)),
            apiStatus: ApiStatus.success,
          )
        );
      }
      catch (e) {
        emit(
          state.copyWith(
            apiStatus: ApiStatus.error,
          )
        );
      }
    });
  }
}