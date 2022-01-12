import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/model/user.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

Future<Profile> login(String email, String password, context) async {
  Profile result = Profile(
      tokenUser: "",
      user: User(
          id: 0,
          email: "",
          password: "",
          name: "",
          phone: "",
          address: "",
          avatar: "",
          userType_id: 0,
          status: 0));
  if (email.isNotEmpty && password.isNotEmpty) {
    final response = await http.post(Uri.parse(LoginUrl),
        body: ({
          "email": email,
          "password": password,
        }));
    //check api status
    if (response.statusCode == 201) {
      DBConfig db = DBConfig.instance;
      // print ("response status ${response.statusCode}");
      // print ("response body ${response.body}");

      result = Profile.fromJson(json.decode(response.body));
      db.insertUser(
          UserProfile(
            id: result.user!.id,
            email: result.user!.email,
            password: result.user!.password,
            name: result.user!.name,
            phone: result.user!.phone,
            address: result.user!.address,
            avatar: result.user!.avatar,
            tokenUser: result.tokenUser,
            status: result.user!.status,
          ),
          'user');
      // print(result.user!.name);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Successfully")));
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Đăng nhập thất bại "),
                content:
                    const Text("Vui lòng nhập lại tài khoản hoặc mật khẩu"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Black field not allowed")));
  }
  return result;
}
