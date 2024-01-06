import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class AccountController {
  bool isLoggedIn = false;
  bool isSignedUp = false;
  Future<bool> validateAccount(String phone, String password) async {
    try {
      var response = await http.post(
        Uri.parse('http://192.168.1.229:5000/login'),
        headers: {"Content-Type": "application/json"}, 
        body: jsonEncode({
          'phoneNumber': phone,
          'password': password
        })
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      print(data['data']);

      if (data['status_code'] == 200) {
        return true;
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to validate account');
    }
  }

  void login(BuildContext context) {
    isLoggedIn = true;
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }
}
