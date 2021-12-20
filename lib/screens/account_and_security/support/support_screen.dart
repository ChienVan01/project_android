import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account_and_security/support/components/body.dart';
import 'package:project_android/components/header.dart';



class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  PreferredSize(
        child: Header(
            title: 'Hỗ trợ',
            backgroundColor: primaryColor,
            textColor: colorWhite,
            action: null),
        preferredSize: Size(double.infinity, 55),
      ),
      body:  Body(),
    );
  }
}
