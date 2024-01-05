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

// class AccountController {
//   bool isLoggedIn = false;

//   Future<bool> validateAccount(String phone, String password) async {
//     // API call to check database
//     var response = await api.checkAccount(phone, password);

//     return response.isValid;
//   }

//   void login(BuildContext context) {
//     isLoggedIn = true;
//     Navigator.pushNamed(context, AppRoutes.homeScreen);
//   }
// }

class AccountController {
  bool isLoggedIn = false;

  Future<bool> validateAccount(String phone, String password) async {
    var response = await http.post(Uri.parse('http://192.168.1.153:5000/login'), 
      body: jsonEncode({
        'phoneNumber': phone,
        'password': password
      })
    );
    // print(response.body);

    var data = jsonDecode(response.body);
    // print(data);
    // print(data['phone']);
    // print('1000000000000000000');
    print(data['status_code']);
    // return data['status_code'] == 200;
    return true;
  }

  void login(BuildContext context) {
    isLoggedIn = true;
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }
}
