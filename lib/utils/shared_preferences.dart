import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  setUserId(int data) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt('userId', data);
  }

  getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }
}
