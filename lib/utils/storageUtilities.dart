import 'package:shared_preferences/shared_preferences.dart';

class StorageUtlities {
  static setStringValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strValue = prefs.getString(key);
    return strValue;
  }

  static clearStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
