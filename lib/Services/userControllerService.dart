import 'dart:convert';

import 'package:flipcart/Widgets/Bars/BottomBar.dart';
import 'package:flipcart/constants/globalVariables.dart';
import 'package:flipcart/constants/utilss.dart';

import 'package:flipcart/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/Handlingerror.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserController {
  void RegisterUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          name: name,
          email: email,
          password: password,
          id: "",
          token: "",
          address: "",
          role: "");

      http.Response res = await http.post(Uri.parse("$uri/Register"),
          body: user.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void SigInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse("$uri/Login"),
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          });
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await preferences.setString(
              'x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
              context, BottomBar.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void GetUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('x-auth-token');

      if (token == null) {
        sharedPreferences.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(Uri.parse("$uri/tokenIsValid"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            "x-auth-token": token!
          });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        // get user data
        http.Response userRes = await http.get(Uri.parse("$uri/"),
            headers: <String, String>{
              "Content-Type": "application/json; charset=UTF-8",
              "x-auth-token": token
            });
        Provider.of<UserProvider>(context, listen: false).setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
