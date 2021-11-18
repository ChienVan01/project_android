import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/screens/order/components/nav_order.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      orderTabs(),
    ]);
  }
}