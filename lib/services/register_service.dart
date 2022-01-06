// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

Future<void> register(String name, String phone, String email, String password,
    String repassword, context) async {
  // Profile result = Profile( tokenUser: "",
  // user: User(id: 0, email: "", password: "", name: "", phone: "", address: "", avatar: "", userTypeId: 0, status: 0)) ;

  if (name.isNotEmpty &&
      phone.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      repassword.isNotEmpty) {
    final response = await http.post(
      Uri.parse(RegisterUrl),
      body: json.encode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": repassword,
      }),
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
      },
    );

    //check api status
    if (response.statusCode == 201) {
      print("response status ${response.statusCode}");
      print("response body ${response.body}");

      // result = Profile.fromJson(json.decode(response.body));
      // // print(result.user!.name);
      //  ScaffoldMessenger.of(context)
      //   .showSnackBar(const SnackBar(content: Text("Register Successfully")));
      // Navigator.pushNamed(context, "/login");
      // jsonResponse = json.decode(response.body.toString());
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(" ${jsonResponse['Message']}")));

      //Or put here your next screen using Navigator.push() method
      // print('success');

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("Đăng kí thành công "),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Đăng kí thất bại "),
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
        .showSnackBar(const SnackBar(content: Text("Vui lòng không bỏ trống")));
  }
}
