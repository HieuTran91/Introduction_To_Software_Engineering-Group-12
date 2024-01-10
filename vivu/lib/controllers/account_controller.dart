import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/models/account_model.dart';
import 'package:vivu/models/car_model.dart';
import 'package:vivu/controllers/car_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Data {
  late bool isCarOwner;
  late int status_code;
}
class AccountSingleton {
  static final AccountSingleton _singleton = AccountSingleton._internal();

  factory AccountSingleton() {
    return _singleton;
  }

  AccountSingleton._internal();

  Account myAccountFromMap = Account();
}

class AccountController {
  bool isLoggedIn = false;
  Account myAccountFromMap = Account();
  final accountSingleton = AccountSingleton();
  Future<bool> validateAccount(String phone, String password) async {
    try {
      // final response = await http.get(Uri.parse('http://192.168.1.155:5000/listcar'));
      // print(jsonDecode(response.body));
      final response = await http.post(
        
        // Uri.parse('http://192.168.1.153:5000/login'),
        Uri.parse('http://192.168.1.155:5000/login'),
        headers: {"Content-Type": "application/json"}, 
        body: jsonEncode({
          'phoneNumber': phone,
          'password': password
        })
      );
      final decodedData = jsonDecode(response.body) as List;

      final firstUserMap = decodedData[0] as Map<String, dynamic>;
      myAccountFromMap = Account.fromMap(firstUserMap);
      accountSingleton.myAccountFromMap = myAccountFromMap;
      if (response.statusCode == 200) {
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
    if (myAccountFromMap.isCarOwner == 0) {
      Navigator.pushNamed(context, AppRoutes.homeScreen);
    } else if (myAccountFromMap.isCarOwner == 1) {
      Navigator.pushNamed(context, AppRoutes.listCarContainerScreen);
    }
    ;
  }
}
