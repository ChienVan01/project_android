import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/cart/components/body.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          child: Header(
              title: 'Giỏ Hàng',
              backgroundColor: primaryColor,
              textColor: backgroundColor),
          preferredSize: Size(double.infinity, 55)),
      body: BodyCart(),
    );
  }
}
