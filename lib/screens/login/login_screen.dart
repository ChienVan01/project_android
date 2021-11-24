import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
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
        child: const Scaffold(
          appBar: PreferredSize(
            child: Header(
                title: 'Đăng Nhập',
                backgroundColor: backgroundColor,
                textColor: primaryTextColor),
            preferredSize: Size(double.infinity, 55),
          ),
          body: BodyLogin(),
        ));
  }
}
