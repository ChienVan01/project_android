import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/model/user.dart';

import '../constants.dart';

Future<void> forgotPassword(String email, context) async {
    User result = 
      User(
          id: 0,
          email: "",
          password: "",
          name: "",
          phone: "",
          address: "",
          otp:"",
          avatar: "",
          userType_id: 0,
          status: 0);
  if (email.isNotEmpty) {
    final response = await http.post(Uri.parse(ForgotUserPassword),
        body: ({
          "Email" : email,
        }));
    //check api status
    if (response.statusCode == 200) {
      
      print ("response status ${response.statusCode}");
      print ("response body ${response.body}");
      result = User.fromJson(json.decode(response.body));
      DBConfig.instance.insertUser(UserProfile(
        id: result.id,
        email: result.email,
        password: result.password,
        name: result.name,
        phone: result.phone,
        address: result.address,
        avatar: result.avatar,
        otp:result.otp.toString(),
        tokenUser: "",
        status: result.status,
      ), "userOTP").then((value) => print('them thanh cong')).onError((error, stackTrace) => print('them that bai'));
      print(result);
      Navigator.pushNamedAndRemoveUntil(context, "/forgotpassword/step02", (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Email không tồn tại"),
                content:
                    const Text("Vui lòng nhập lại email !"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialogs
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
}
