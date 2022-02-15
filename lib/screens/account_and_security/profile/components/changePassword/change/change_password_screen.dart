import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
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
          children:  <Widget> [
          const TextFieldWidget(text:"Mật khẩu mới",obscureText:true),
         const TextFieldWidget(text:"Xát nhận mật khẩu mới",obscureText:true),
            ElevatedButton(
                onPressed: () {
                 
                },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(400, 50))),
                child:
                    Text('Xác nhận', style: style(20, Colors.white, FontWeight.bold)),
              ),
        ]));
  }
}

