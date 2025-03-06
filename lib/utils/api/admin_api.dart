import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:ulearning_app_admin/utils/constants/authorization.dart';
import 'package:ulearning_app_admin/utils/constants/global.dart';
import 'package:ulearning_app_admin/utils/constants/server.dart';
import 'package:ulearning_app_admin/utils/entities/admin.dart';

class AdminAPI {
  static Future <String> signInAdmin({
    required String email,
    required String password,
  }) async {

    try {
      Uri url = Uri.https(Server.serverURL, '/api/api/auth/loginFirebaseAdmin');
      var firebaseLogInResponse = await http.post(
        url,
        body: {
          "email": email,
          "password": password,
        },
      );

      var firebaseLogInResponseBody = jsonDecode(firebaseLogInResponse.body);
      
      url = Uri.https(Server.serverURL, '/api/api/auth/loginAdmin');

      AdminAccount admin = AdminAccount(
        name: firebaseLogInResponseBody["data"]["displayName"],
        email: email,
        password: password,
        type: "1",
        avatar: firebaseLogInResponseBody["data"]["profilePicture"],
        openId: firebaseLogInResponseBody["data"]["localId"],
      );


      var response = await http.post(
        url,
        body: admin.toJson(),
      );
      
      Global.storageService.setString(Authorization.authorizationPath, jsonDecode(response.body)["data"]["access_token"]);

      return response.body;
    }
    catch (e) {
      return "Something went wrong";
    }


  } 

  static Future <void> signOutAdmin() async {
    try {
      await Global.storageService.remove(Authorization.authorizationPath);
      debugPrint(Global.storageService.getUserToken());
    }
    catch (e) {
      return;
    }
  }
}