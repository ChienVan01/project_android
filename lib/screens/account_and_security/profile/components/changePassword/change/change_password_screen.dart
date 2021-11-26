import 'package:flutter/material.dart';
import 'package:project_android/screens/account_and_security/header.dart';
import 'package:project_android/screens/account_and_security/profile/components/button_widget.dart';
import 'package:project_android/screens/account_and_security/profile/components/textfield_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: header("Thay đổi mật khẩu", context,null)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget> [
          TextFieldWidget(text:"Mật khẩu mới"),
          TextFieldWidget(text:"Xát nhận mật khẩu mới"),
           ButtonWidget(txtBtn: "Xác nhận",press:'/account_and_security/profile'),
        ]));
  }
}

