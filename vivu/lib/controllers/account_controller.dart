import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// class API {
//   Future<dynamic> checkAccount(String phone, String password) async {
//     return {"isValid": phone == "123" && password == "password"}; //api call
//   }
// }

// API api = API(); // This creates an instance of your API class

class AccountController {
  bool isLoggedIn = false;

  Future<bool> validateAccount(String phone, String password) async {
    // API call to check database
    // var response = await api.checkAccount(phone, password);
    // return response.isValid;

  //   var response = await http.post(
  //     Uri.parse('http://192.168.1.153:5000/login'), 
  //     body: jsonEncode({
  //       'phoneNumber': phone,
  //       'password': password
  //     })
  //   );

  //   var data = jsonDecode(response.body);
  //   print(data);
  // return data['status_code'] == 200;
    try {
      // var response = await http.post(
      //   Uri.parse('http://127.0.0.1:5000/login'), 
      //   body: jsonEncode({
      //     'phoneNumber': phone,
      //     'password': password
      //   })
      // );
      var response = await http.post(
        Uri.parse('http://192.168.1.153:5000/login'),
        headers: {"Content-Type": "application/json"}, 
        body: jsonEncode({
          'phoneNumber': phone,
          'password': password
        })
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      print(data['msg']);

      if (data['status_code'] == 200) {
        return true;
      } else {
        throw Exception('Invalid credentials');
      }
      // var data = jsonDecode(response.body);
      // print(data);

      // if (response.statusCode == 200 && data['status_code'] == 200) {
      //   return true;
      // } else {
      //   throw Exception('Invalid credentials');
      // }
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
