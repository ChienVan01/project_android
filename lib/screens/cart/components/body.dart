import 'package:flutter/material.dart';
import 'package:project_android/screens/cart/components/product_cart.dart';

class BodyCart extends StatelessWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[ProductCart()]);
  }
}
