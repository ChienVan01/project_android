import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account_and_security/profile/components/button_widget.dart';
import 'package:project_android/screens/account_and_security/profile/components/textfield_widget.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  const ConfirmPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
        child: Header(
            title: 'Xác nhận mật khẩu',
            backgroundColor: primaryColor,
            textColor: colorWhite,
            action: null),
        preferredSize: Size(double.infinity, 55),
      ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:const <Widget>[
              TextFieldWidget(text: "Nhập mật khẩu hiện tại",obscureText:true),
              ButtonWidget(txtBtn: "Tiếp tục",press:'/account_and_security/profile/components/changePassword/change'),
            ]));
  }
}

