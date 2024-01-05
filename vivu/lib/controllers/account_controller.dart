import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

class API {
  Future<dynamic> checkAccount(String phone, String password) async {
    return {"isValid": phone == "123" && password == "password"}; //api call
  }
}

API api = API(); // This creates an instance of your API class

class AccountController {
  bool isLoggedIn = false;

  Future<bool> validateAccount(String phone, String password) async {
    // API call to check database
    var response = await api.checkAccount(phone, password);

    return response.isValid;
  }

  void login(BuildContext context) {
    isLoggedIn = true;
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }
}
