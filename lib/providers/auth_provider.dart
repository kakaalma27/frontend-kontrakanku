import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/models/user_models.dart';
import 'package:frontend_kontrakan/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  late UserModels _user;
  UserModels get user => _user;

  set user(UserModels user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password,
    required String password_confirmation,
    required int role,
  }) async {
    try {
      UserModels user = await AuthServices().register(
        name: name,
        username: username,
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        role: role,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModels user = await AuthServices().login(
        email: email,
        password: password,
      );
      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      print('Error saat login: $e');
      return false;
    }
  }

  Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(token);
    await prefs.setString('access_token', token); // Save token
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token'); // Get token
  }

  Future<bool> logout() async {
    try {
      if (_user.token == null || _user.token!.isEmpty) {
        throw Exception('Token tidak valid. Pengguna belum login.');
      }

      bool success = await AuthServices().logout(token: _user.token!);
      if (success) {
        _user = UserModels(); // Reset user data
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      print('Error saat logout: $e');
      return false;
    }
  }

  Future<bool> updateProfile({
    required String name,
    required String username,
    required String email,
  }) async {
    try {
      UserModels user = await AuthServices().update(
        name: name,
        username: username,
        email: email,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> checkEmail({required String email}) async {
    try {
      bool success = await AuthServices().checkEmail(email: email);
      return success;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> verifyToken(String email, String token) async {
    try {
      notifyListeners();

      await AuthServices().verifyToken(email: email, token: token);

      notifyListeners();
      return true;
    } catch (e) {
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  Future<bool> resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      bool success = await AuthServices().resetPassword(
        email: email,
        token: token,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      return success;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
