import 'package:flutter/material.dart';

import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';

import 'package:project_android/screens/account_and_security/address/components/body.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  PreferredSize(
        child:  Header(
            title: 'Thay đổi địa chỉ',
            backgroundColor: primaryColor,
            textColor: colorWhite,
            action: null),
        preferredSize: Size(double.infinity, 55),
      ),
      body:  Body(),
    );
  }
}
