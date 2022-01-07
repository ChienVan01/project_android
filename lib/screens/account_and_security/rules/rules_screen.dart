import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account_and_security/rules/components/body.dart';
import 'package:project_android/components/header.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        child: Header(
            title: 'Điều khoản',
            backgroundColor: primaryColor,
            textColor: colorWhite,
            action: null),
        preferredSize: Size(double.infinity, 55),
      ),
      body: Body(),
    );
  }
}
