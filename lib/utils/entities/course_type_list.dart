import 'package:ulearning_app_admin/utils/entities/course_type.dart';

class CoursesTypeList {
  CoursesTypeList({
    this.coursesType
  });

  List <CourseType>? coursesType;

  factory CoursesTypeList.fromJson(Map <String, dynamic> json) {

    List <CourseType> temp = List <CourseType>.from(json["data"].map((x) => CourseType.fromJson(x)));
    return CoursesTypeList(
      coursesType: temp.isEmpty
        ? []
        : temp,
    );
  }
}