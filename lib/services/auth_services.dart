import 'dart:convert';
import 'package:http/http.dart' as http; // Import package http
import 'package:frontend_kontrakan/models/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  String baseUrl = 'http://192.168.20.251:8000/api/auth';

  Future<UserModels> register({
    required String name,
    required String username,
    required String email,
    required String password,
    required String password_confirmation,
    required int role,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
      'role': role.toString()
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModels user = UserModels.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      var errorMessage =
          jsonDecode(response.body)['message'] ?? 'Gagal Register';
      throw Exception(errorMessage);
    }
  }

  Future<UserModels> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModels user = UserModels.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      
      return user;
    } else {
      // Menangkap pesan error dari respons server
      var errorMessage = jsonDecode(response.body)['message'] ?? 'Gagal Login';
      throw Exception(errorMessage);
    }
  }

  Future<bool> logout({required String token}) async {
    var url = Uri.parse('$baseUrl/logout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.post(
      url,
      headers: headers,
    );

    print(response.body);
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('access_token');
      return true;
    } else {
      var errorMessage = jsonDecode(response.body)['message'] ?? 'Gagal Logout';
      throw Exception(errorMessage);
    }
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    print(token);
    return token != null && token.isNotEmpty;
  }

  Future<UserModels> update({
    required String name,
    required String username,
    required String email,
  }) async {
    var url = Uri.parse('$baseUrl/user');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
    });

    var response = await http.put(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModels user = UserModels.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      var errorMessage = jsonDecode(response.body)['message'] ?? 'Gagal Update';
      throw Exception(errorMessage);
    }
  }

  Future<bool> resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    var url = Uri.parse('$baseUrl/reset-password');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'token': token,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    var response = await http.post(url, headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      var errorMessage =
          jsonDecode(response.body)['message'] ?? 'Gagal mereset password';
      throw Exception(errorMessage);
    }
  }

  Future<bool> checkEmail({required String email}) async {
    var url = Uri.parse('$baseUrl/check-email');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'email': email});

    var response = await http.post(url, headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      var errorMessage =
          jsonDecode(response.body)['message'] ?? 'Gagal memverifikasi email';
      throw Exception(errorMessage);
    }
  }

  Future<bool> verifyToken(
      {required String email, required String token}) async {
    var url = Uri.parse('$baseUrl/verify-token');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'email': email, 'token': token});

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Token verifikasi tidak valid');
    }
  }

  Future<bool> updatePassword({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    var url = Uri.parse('$baseUrl/reset-password');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    var response = await http.post(url, headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      var errorMessage =
          jsonDecode(response.body)['message'] ?? 'Gagal memperbarui password';
      throw Exception(errorMessage);
    }
  }
}
