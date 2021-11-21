import 'package:flutter/material.dart';
import 'package:project_android/screens/order/components/body.dart';
import 'package:project_android/screens/order/components/header.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 50), child: HeaderOrder()),
        body: Body(),
      ),
    );
  }
}
