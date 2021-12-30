import 'package:flutter/material.dart';
import 'package:project_android/components/search_bar.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/screens/cart/cart_screen.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:provider/provider.dart';

class HeaderDetailProduct extends StatelessWidget {
  const HeaderDetailProduct({Key? key, this.product}) : super(key: key);
  final Product? product;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final double total = cart.getTotalPrice();
    return AppBar(
      toolbarHeight: 70,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.navigate_before_outlined, size: 30)),
      title: const SearchBar(),
      actions: <Widget>[
        Row(
          children: [
            IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      // double total = cart.getTotalPrice();
                      cart.removeTotalPrice(total);
                      return CartScreen(product: product);
                    }))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: defaultPadding / 2),
          child: IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
