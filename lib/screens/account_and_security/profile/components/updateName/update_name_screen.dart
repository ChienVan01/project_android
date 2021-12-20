import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/screens/account_and_security/profile/components/textfield_widget.dart';

class UpdateNameScreen extends StatelessWidget {
  const UpdateNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  PreferredSize(
          child: Header(
              title: 'Sửa tên',
              backgroundColor: primaryColor,
              textColor: colorWhite,
              action: <Widget>[
                ElevatedButton(onPressed: () {}, child: const Text("Lưu"),style: ButtonStyle(elevation: MaterialStateProperty.all(0),))
              ]),
          preferredSize: Size(double.infinity, 55),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              TextFieldWidget(text: "Nhập vào đây",obscureText:false),
              Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Text("dưới 100 kí tự"),
              )
            ]));
  }
}
