// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

Future<void> updateUser(String? name, String? email, String? password,
    String? phone, id, context) async {
  // Profile result = Profile( tokenUser: "",
  // user: User(id: 0, email: "", password: "", name: "", phone: "", address: "", avatar: "", userTypeId: 0, status: 0)) ;

  try {
    final response = await http.put(
      Uri.parse(UpdateUserUrl + '/$id'),
      body: json.encode({
        "Name": name,
        "Password": password,
        "Email": email,
        "Phone": phone,

        // "password_confirmation": repassword,
      }),
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
      },
    );

    //check api status
    if (response.statusCode == 200) {
      print("response status ${response.statusCode}");
      print("response body ${response.body}");

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("Cập nhật thành công"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Cập nhật thất bại "),
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
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Vui lòng không bỏ trống")));
  }
}
