
import 'package:ulearning_app_admin/utils/entities/course_list.dart';
import 'package:ulearning_app_admin/utils/enum/api.dart';

class CoursesListStates {
  CoursesListStates({
    this.courseList,
    this.apiStatus = ApiStatus.idle,
  });

  final CoursesList? courseList;
  final ApiStatus apiStatus;

  CoursesListStates copyWith({
    CoursesList? courseList,
    ApiStatus? apiStatus
  }) {
    return CoursesListStates(
      courseList: courseList ?? this.courseList,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }
}