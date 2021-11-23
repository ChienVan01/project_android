import 'package:flutter/material.dart';
import 'package:project_android/screens/account_and_security/rules/components/body.dart';
import 'package:project_android/screens/account_and_security/header.dart';



class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: header("Điều khoản",context)),
      body: const Body(),
    );
  }
}
