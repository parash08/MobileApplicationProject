import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String authTokenKey = 'authToken';

  static Future<void> setAuthToken(String authToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(authTokenKey, authToken);
  }

  static Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(authTokenKey);
  }

  static Future<void> clearAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(authTokenKey);
  }

  static Future<bool> isLoggedIn() async {
    final String? authToken = await getAuthToken();
    return authToken != null && authToken.isNotEmpty;
  }
}
