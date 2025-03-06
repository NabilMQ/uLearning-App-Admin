import 'package:http/http.dart' as http;
import 'package:ulearning_app_admin/utils/constants/server.dart';

class UserAPI {
  static Future <String> getListUser(String token) async {
    try {
      Uri url = Uri.https(
        Server.serverURL,
        '/api/api/userListAdmin',
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