import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/register/components/body.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

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
          appBar: PreferredSize(
            child:  Header(
                title: 'Đăng kí',
                backgroundColor: backgroundColor,
                textColor: primaryTextColor,
                action: null),
            preferredSize: Size(double.infinity, 55),
          ),
          body: BodyRegister(),
        ));
  }
}
