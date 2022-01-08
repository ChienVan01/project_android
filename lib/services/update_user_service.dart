// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

Future<void> update(String name ,id,context) async {
  // Profile result = Profile( tokenUser: "",
  // user: User(id: 0, email: "", password: "", name: "", phone: "", address: "", avatar: "", userTypeId: 0, status: 0)) ;

  if (name.isNotEmpty  ) {
    final response = await http.put(
      Uri.parse(UpdateUserUrl+'/$id'),
      body: json.encode({
        "Name": name,
        // "email": email,
        // "phone": phone,
        // "password": password,
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
                content: const Text("Cập nhật thành công"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/account");
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
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Vui lòng không bỏ trống")));
  }
}
