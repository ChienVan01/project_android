import 'package:flutter/material.dart';

import 'package:project_android/screens/account_and_security/profile/components/body.dart';
import 'package:project_android/screens/account_and_security/header.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: header("Sửa hồ sơ",context)),
      body: const Body(),
    );
  }
}
