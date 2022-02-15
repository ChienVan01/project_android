// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_android/screens/order/components/body.dart';
import 'package:project_android/screens/order/components/header.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key, required this.userId}) : super(key: key);
  String userId;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 50), child: HeaderOrder()),
        body: BodyOrder(userId: userId),
      ),
    );
  }
}
