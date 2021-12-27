import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

import 'package:project_android/screens/account_and_security/profile/components/body.dart';
import 'package:project_android/components/header.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: Header(
            title: 'Sửa hồ sơ',
            backgroundColor: primaryColor,
            textColor: colorWhite,
            action: null),
        preferredSize: Size(double.infinity, 55),
      ),
      body: const Body(),
    );
  }
}
