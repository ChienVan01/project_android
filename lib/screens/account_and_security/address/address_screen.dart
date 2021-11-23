import 'package:flutter/material.dart';

import 'package:project_android/screens/account_and_security/header.dart';

import 'package:project_android/screens/account_and_security/address/components/body.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: header("Thay đổi địa chỉ", context)),
      body: const Body(),
    );
  }
}
