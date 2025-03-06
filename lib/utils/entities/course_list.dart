
import 'package:ulearning_app_admin/utils/entities/course.dart';

class CoursesList {
  CoursesList({
    this.courses
  });

  List <Course>? courses;

  factory CoursesList.fromJson(Map <String, dynamic> json) {

    List <Course> temp = List <Course>.from(json["data"].map((x) => Course.fromJson(x)));
    
    return CoursesList(
      courses: temp.isEmpty
        ? []
        : temp,
    );
  }
}