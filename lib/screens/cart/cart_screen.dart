// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/screens/cart/components/body.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:project_android/screens/cart/components/footer.dart';
import 'package:project_android/screens/cart/components/product_cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, this.product}) : super(key: key);
  final Product? product;
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
