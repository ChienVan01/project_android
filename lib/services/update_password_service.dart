// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';

Future<void> updatePassword(String password ,id,context) async {

  try {
    final response = await http.put(
      Uri.parse(UpdatePasswordUrl + '/$id'),
      body: json.encode({
        "Password": password,  
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
                content: const Text("Xác nhận thành công"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, "/account_and_security/profile/components/changePassword/change");
                    },
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Xác nhận thất bại "),
                content:
                    const Text("Vui lòng nhập lại mật khẩu"),
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
