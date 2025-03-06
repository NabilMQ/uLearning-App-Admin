
import 'package:ulearning_app_admin/utils/entities/course_type_list.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';

class CoursesTypeListStates {
  CoursesTypeListStates({
    this.coursesTypeList,
    this.apiStatus = ApiStatus.idle,
  });

  final CoursesTypeList? coursesTypeList;
  final ApiStatus apiStatus;

  CoursesTypeListStates copyWith({
    CoursesTypeList? coursesTypeList,
    ApiStatus? apiStatus
  }) {
    return CoursesTypeListStates(
      coursesTypeList: coursesTypeList ?? this.coursesTypeList,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }
}