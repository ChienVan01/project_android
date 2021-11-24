import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/login/components/body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode curentFocus = FocusScope.of(context);
          if (!curentFocus.hasPrimaryFocus) {
            curentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.navigate_before_outlined,
                  color: primaryTextColor, size: 30),
            ),
            title: Container(
              width: 240,
              child: Center(
                child: Text(
                  'Đăng nhập',
                  style: style(22, primaryTextColor, FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            backgroundColor: backgroundColor,
          ),
          body: const BodyLogin(),
        ));
  }
}
