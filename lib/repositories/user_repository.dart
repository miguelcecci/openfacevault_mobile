import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:openfacevault_mobile/services/user_service.dart';

class UserRepository {
  final _userService = UserService();

  Future<bool> doLogin(String login, String password, String endpoint) async {

    final _prefs = await SharedPreferences.getInstance();
    final token = await _userService.doLogin(login, password, endpoint);
    
    _prefs.setString('login', login);
    _prefs.setString('password', password);
    _prefs.setString('token', token);

    return token != null;
  }
}