import 'package:flutter/material.dart';

import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';

import 'package:project_android/screens/account_and_security/address/components/body.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
