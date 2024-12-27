import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:product_catalog_project/core/app/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthService {
  Future<Map<String, dynamic>> signUp(
      String name, String email, String password) async {
    final url = Uri.parse('$constantUrl/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'name': name,
            'email': email,
            'password': password,
          },
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        final data = json.decode(response.body);
        return {'status': 'success', 'token': data['action_register']['token']};
      } else {
        final data = json.decode(response.body);
        return {
          'status': 'error',
          'message': data['internal']['response']['body']['message']
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = Uri.parse('$constantUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'email': email,
            'password': password,
          },
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        final data = json.decode(response.body);
        return {'status': 'success', 'token': data['action_login']['token']};
      } else {
        final data = json.decode(response.body);
        return {
          'status': 'error',
          'message': data['internal']['response']['body']['message']
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': e.toString()};
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final remember = prefs.getBool('remember');
    final expiry = prefs.getString('token_expiry');

    if (token != null && expiry != null && remember != null) {
      final expiryDate = DateTime.parse(expiry);
      if (DateTime.now().isBefore(expiryDate)) {
        return token;
      } else {
        await prefs.remove('token');
        await prefs.remove('remember');
        await prefs.remove('token_expiry');
      }
    }
    return null;
  }
}
