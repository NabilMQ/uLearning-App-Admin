import 'package:http/http.dart' as http;
import 'package:ulearning_app_admin/utils/constants/server.dart';

class CourseAPI {
  static Future <String> getListCourse(String token) async {
    try {
      Uri url = Uri.https(
        Server.serverURL,
        '/api/api/courseListAdmin',
      );

      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token"
        }
      );
      return response.body;
    }
    catch (e) {
      return "Something went wrong";
    }
  }

  static Future <String> getListCourseType(String token) async {
    try {
      Uri url = Uri.https(
        Server.serverURL,
        '/api/api/courseTypeListAdmin',
      );

      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token"
        }
      );
      
      return response.body;
    }
    catch (e) {
      return "Something went wrong";
    }
  }
}