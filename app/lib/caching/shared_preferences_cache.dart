import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/models/token.dart';

class _SharedPreferencesCache {

  static const keyAccess = 'TOKEN_ACCESS';
  static const keyRefresh = 'TOKEN_REFRESH';
  static const tokenType = 'TOKEN_TYPE';
  static const keyExpires = 'TOKEN_EXPIRES';
  
  static Future<bool> isLogged() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final isLogged = sharedPreferences.getBool('IS_LOGGED') ?? false;
    return isLogged;
  }

  static Future<void> saveLogged(bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('IS_LOGGED', value);
  }

  static Future<String?> getLoggedUsername() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.getString('LOGGED_USERNAME');
    return username;
  }

  static Future<void> setLoggedUsername(String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('LOGGED_USERNAME', value);
  }
  static Future<int?> getLoggedUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.getInt('LOGGED_USERID');
    return username;
  }

  static Future<void> setLoggedUserId(int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('LOGGED_USERID', value);
  }


  static Future<Token> getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final access = sharedPreferences.getString(keyAccess);
    final refresh = sharedPreferences.getString(keyRefresh);
    final type = sharedPreferences.getString(tokenType);
    final expiresIn = sharedPreferences.getString(keyExpires);
    return Token(access, refresh, type, expiresIn);
  }

  static Future<void> setToken(Token token) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(keyAccess, token.access ?? '');
    await sharedPref.setString(keyRefresh, token.refresh ?? '');
    await sharedPref.setString(tokenType, token.type ?? '');
    await sharedPref.setString(keyExpires, token.expiresIn ?? '');
  }
}