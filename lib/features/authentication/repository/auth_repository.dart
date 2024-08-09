import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants/secure_storage.dart';
import '../models/user_model.dart';

class AuthRepository {
  final String baseUrl = "${dotenv.env['ENDPOINT']}";
  final SecureStorage secureStorage = SecureStorage();

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print('Login response: ${response.body}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final user = UserModel.fromJson(data['user']);
        await secureStorage.writeToken(data['remember_me_token']);
        await _saveUserData(data['user']);
        return user;
      } else {
        print('Login failed with status code: ${response.statusCode}');
        final errorMessage = _parseError(response.body);
        throw Exception('Failed to login: $errorMessage');
      }
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }

  Future<UserModel> register(String email, String password, String fname,
      String lname, String phone) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'fname': fname,
          'lname': lname,
          'phone': phone,
        }),
      );

      print('Register response: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final user = UserModel.fromJson(data['user']);
        await secureStorage.writeToken(data['token']);
        await _saveUserData(data['user']);
        // Request OTP after registration
        await requestOtp(user.id);
        return user;
      } else {
        print('Register failed with status code: ${response.statusCode}');
        final errorMessage = _parseError(response.body);
        throw Exception('Failed to register: $errorMessage');
      }
    } catch (e) {
      print('Register error: $e');
      rethrow;
    }
  }

  Future<void> requestOtp(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/request-otp?user_id=$userId'),
      );

      if (response.statusCode == 200) {
        print('OTP request successful');
      } else {
        print('OTP request failed with status code: ${response.statusCode}');
        final errorMessage = _parseError(response.body);
        throw Exception('Failed to request OTP: $errorMessage');
      }
    } catch (e) {
      print('OTP request error: $e');
      rethrow;
    }
  }

  Future<void> verifyOtp(int otp) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/verify-otp?otp=$otp'),
      );

      if (response.statusCode == 200) {
        print('OTP verification successful');
      } else {
        print('OTP verification failed with status code: ${response.statusCode}');
        final errorMessage = _parseError(response.body);
        throw Exception('Failed to verify OTP: $errorMessage');
      }
    } catch (e) {
      print('OTP verification error: $e');
      rethrow;
    }
  }

  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', json.encode(userData));
      print('User data saved successfully');
    } catch (e) {
      print('Error saving user data: $e');
      rethrow;
    }
  }

  Future<UserModel?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString('user');
      if (userData != null) {
        print('User data retrieved from shared preferences');
        return UserModel.fromJson(json.decode(userData));
      }
      print('No user data found in shared preferences');
      return null;
    } catch (e) {
      print('Error retrieving user data: $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
      await secureStorage.deleteToken();
      print('User logged out successfully');
    } catch (e) {
      print('Error logging out: $e');
      rethrow;
    }
  }
  // Method to parse error response
  String _parseError(String responseBody) {
    try {
      final data = json.decode(responseBody);
      if (data['error'] != null) {
        // Handle specific cases based on the structure of the error response
        if (data['error'] is Map) {
          final errors = data['error'] as Map<String, dynamic>;
          return errors.values
              .expand((e) => (e as List).map((msg) => msg.toString()))
              .join('\n');
        } else if (data['error'] is String) {
          return data['error'] as String;
        }
      }
      return 'An unknown error occurred';
    } catch (e) {
      print('Error parsing error response: $e');
      return 'An unknown error occurred';
    }
  }
}
