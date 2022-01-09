import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';

Future logoutService(token, int id, context) async {
  final response = await http.post(Uri.parse(LogoutUrl),
      headers: ({'Authorization': 'Bearer ' + token}));
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Logout Successfully")));
    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    DBConfig.instance.delete(id, 'user');
  } else {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Đăng xuat thất bại "),
              content: const Text("Vui lòng xuat lại tài khoản hoặc mật khẩu"),
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
}
