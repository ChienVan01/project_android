import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/cart/components/body.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:project_android/screens/cart/components/footer.dart';
import 'package:project_android/screens/cart/components/product_cart.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          child: Header(
            title: 'Giỏ Hàng',
            backgroundColor: primaryColor,
            textColor: backgroundColor,
            action: null,
          ),
          preferredSize: Size(double.infinity, 55)),
      body: BodyCart(),
      bottomNavigationBar: FooterCart(),
    );
  }
}
