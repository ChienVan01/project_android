import 'package:flutter/material.dart';
import 'package:project_android/screens/account_and_security/support/components/body.dart';
import 'package:project_android/screens/account_and_security/header.dart';



class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: header("Hỗ Trợ",context,null)),
      body: const Body(),
    );
  }
}
