import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vivu/models/accountModel.dart';
//import 'package:vivu/models/accountModel.dart';
// class API {
//   Future<dynamic> checkAccount(String phone, String password) async {
//     return {"isValid": phone == "123" && password == "password"}; //api call
//   }
// }

// API api = API(); // This creates an instance of your API class

class AccountController {
  bool isLoggedIn = false;
  Account myAccountFromMap = Account();
  Future<bool> validateAccount(String phone, String password) async {
    try {
      final response = await http.post(
        
        // Uri.parse('http://192.168.1.153:5000/login'),
        Uri.parse('http://192.168.1.229:5000/login'),
        headers: {"Content-Type": "application/json"}, 
        body: jsonEncode({
          'phoneNumber': phone,
          'password': password
        })
      );
      // final decodedData = jsonDecode(response.body) as List;
      // final firstUser = decodedData[0] as Map<String, dynamic>;

      final decodedData = jsonDecode(response.body) as List;
      // Assuming decodedData is a List<dynamic>
      // final firstUserMap = decodedData.isNotEmpty ? decodedData[0] as Map<String, dynamic> : null;

      // if (firstUserMap != null) {
      //   // Ensure the Account.fromMap method handles null values appropriately
      //   Account myAccountFromMap = Account.fromMap(firstUserMap);
      //   print(myAccountFromMap.accountID);
      // } else {
      //   print('Error: No data or incorrect data format.');
      // }
      final firstUserMap = decodedData[0] as Map<String, dynamic>;
      print(firstUserMap);
      myAccountFromMap = Account.fromMap(firstUserMap);
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
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }
}
