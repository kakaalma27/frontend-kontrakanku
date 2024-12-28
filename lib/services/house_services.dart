import 'dart:convert';
import 'package:frontend_kontrakan/models/house_models.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_kontrakan/providers/auth_provider.dart'; // Import AuthProvider
import 'package:provider/provider.dart'; // For context access

class HouseServices {
  static const String baseUrl = "http://192.168.20.251:8000/api/houses";

  Future<String?> _getToken(context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return await authProvider.user.token;
  }

  Future<int?> _getUserId(context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return authProvider.user.id;
  }

  Future<HouseModels> storeHouse(
      context, Map<String, dynamic> houseData) async {
    final token = await _getToken(context);

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/store'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(houseData),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print('Token: $token');
      print('House Data: $houseData');
      if (response.statusCode == 200) {
        // Mengurai respons JSON
        final jsonResponse = jsonDecode(response.body);
        return HouseModels.fromJson(
            jsonResponse['data']); // Ambil data dari respons
      } else {
        final errorResponse = jsonDecode(response.body);
        throw Exception(
            'Failed to store house: ${errorResponse['meta']['message'] ?? 'Unknown error'}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to store house: $e');
    }
  }

  Future<List<HouseModels>> fetchHouses(context) async {
    final token = await _getToken(context);

    final response = await http.get(
      Uri.parse('$baseUrl/get-all'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<HouseModels> houses = [];

      for (var item in data) {
        houses.add(HouseModels.fromJson(item));
      }

      return houses;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
