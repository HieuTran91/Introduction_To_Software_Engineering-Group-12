import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/models/account_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Data {
  late bool isCarOwner;
  late int status_code;
}


class AccountController {
  bool isLoggedIn = false;
  Account myAccountFromMap = Account();
  Future<bool> validateAccount(String phone, String password) async {
    try {
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
      print(firstUserMap);
      myAccountFromMap = Account.fromMap(firstUserMap);

      // final decodedData = jsonDecode(response.body) as List;
      // final firstUser = decodedData[0] as Map<String, dynamic>;

      // final account = accountModel.fromMap(firstUserMap);
      // print(account);
    // Now you have an accountModel object with the data
      // print("Account ID: ${account.accountID}");
      // print("Full Name: ${account.fullName}");
      if (response.statusCode == 200) {
        // accountModel item = accountModel.fromMap(data['']);
        // print(item);
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
