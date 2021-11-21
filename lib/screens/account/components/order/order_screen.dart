import 'package:flutter/material.dart';
import 'package:project_android/screens/account/components/body.dart';
import 'package:project_android/screens/account/components/order/components/header.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child:   Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 50), 
            child: HeaderOrder()),
        body: Body(),
      ),
    );
  }
}
