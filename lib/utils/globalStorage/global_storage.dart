import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app_admin/utils/constants/authorization.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future <bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future <bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getIsLoggedIn() {
    return _prefs.getString(Authorization.authorizationPath) == null
      ? false
      : true;
  }

  Future <bool> remove(String key) {
    return _prefs.remove(key);
  }

  String getUserToken() {
    return _prefs.getString(Authorization.authorizationPath) ?? "";
  }
}