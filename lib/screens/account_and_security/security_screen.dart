import 'package:flutter/material.dart';
import 'package:project_android/screens/account_and_security/components/body.dart';
import 'package:project_android/screens/account_and_security/header.dart';



class AccountAndSecurity extends StatelessWidget {
  const AccountAndSecurity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: header("Tài khoản và bảo mật",context,null)),
      body: const Body(),
    );
  }
}
