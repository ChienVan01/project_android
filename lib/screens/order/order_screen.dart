import 'package:flutter/material.dart';

import 'package:project_android/screens/order/components/header.dart';
import 'package:project_android/screens/order/components/body.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: headerOrder(context)),
      body: const Body(),
    );
  }
}
