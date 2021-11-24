import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account_and_security/header.dart';
import 'package:project_android/screens/account_and_security/profile/components/textfield_widget.dart';

class UpdateNameScreen extends StatelessWidget {
  const UpdateNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: header("Sửa tên", context,<Widget>[
              ElevatedButton(onPressed: (){}, child:const Text("Lưu"))
            ])),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget> [
          TextFieldWidget(text:"Nhập vào đây"),
          Padding(
            padding:  EdgeInsets.all(defaultPadding / 2),
            child: Text("dưới 100 kí tự"),
          )
        ]));
  }
}

