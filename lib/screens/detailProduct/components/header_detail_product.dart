import 'package:flutter/material.dart';
import 'package:project_android/components/search_bar.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:provider/provider.dart';

class HeaderDetailProduct extends StatelessWidget {
  const HeaderDetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.navigate_before_outlined, size: 30)),
      title: SearchBar(),
      actions: <Widget>[
        Row(
          children: [
            IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () => Navigator.pushNamed(context, '/cart')),
            // Container(
            //   height: 10,
            //   width: 10,
            //   // color: Colors.white,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50),
            //   ),
            //   child: Consumer<CartProvider>(
            //     builder: (context, value, child) {
            //       return Text(value.getCounter().toString(),
            //           style: const TextStyle(color: Colors.white));
            //     },
            //   ),
            // )
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
