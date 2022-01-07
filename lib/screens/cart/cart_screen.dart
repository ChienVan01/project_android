// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/cart/components/body.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:project_android/screens/cart/components/footer.dart';
import 'package:project_android/screens/cart/components/product_cart.dart';
import 'package:project_android/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, this.product}) : super(key: key);
  final Product? product;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  UserProfile user = UserProfile(
      id: 0,
      email: '',
      password: '',
      name: '',
      phone: '',
      address: '',
      avatar: '',
      tokenUser: '',
      status: 0);

  Future refreshNote() async {
    user = await DBConfig.instance.getUser();
  }

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  @override
  Widget build(BuildContext context) {
    refreshNote();
    return user.name == ''
        ? const Login()
        : const Scaffold(
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
