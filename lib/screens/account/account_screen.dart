import 'package:flutter/material.dart';

import '../../constants.dart';

import 'components/header.dart';
import 'package:project_android/screens/account/components/body.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: appBar(context)),
      body: Body(),
    );
  }
}
