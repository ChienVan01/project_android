import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account_and_security/profile/components/button_widget.dart';
import 'package:project_android/screens/account_and_security/profile/components/textfield_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:const PreferredSize(
        child: Header(
            title: 'Thay đổi mật khẩu',
            backgroundColor: primaryColor,
            textColor: colorWhite,
            action: null),
        preferredSize: Size(double.infinity, 55),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget> [
          TextFieldWidget(text:"Mật khẩu mới",obscureText:true),
          TextFieldWidget(text:"Xát nhận mật khẩu mới",obscureText:true),
           ButtonWidget(txtBtn: "Xác nhận",press:'/account_and_security/profile'),
        ]));
  }
}

