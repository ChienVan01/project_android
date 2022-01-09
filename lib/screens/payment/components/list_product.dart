import 'package:intl/intl.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';
import 'package:project_android/model/cart.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key, required this.listProduct}) : super(key: key);
  final List<Cart> listProduct;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: listProduct.map((e) => product(context, e)).toList(),
    );
  }
}

Widget product(context, Cart cart) {
  return Container(
    height: 120,
    color: Colors.white,
    padding: const EdgeInsets.all(defaultPadding / 4),
    margin: const EdgeInsets.only(bottom: defaultPadding),
    child: Row(children: <Widget>[
      Image.network('http://10.0.2.2:8080/upload/product/${cart.avatar}',
          width: 120),
      // SizedBox(width: 120, child: Text(widget.cart.avatar)),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cart.name,
              style: style(16, primaryTextColor, FontWeight.bold),
            ),
            Text(
              NumberFormat.decimalPattern().format(cart.price) + 'đ',
              style: style(16, primaryColor, FontWeight.bold),
            ),
            Text(
              NumberFormat.decimalPattern().format(cart.price * 1.1) + 'đ',
              style: const TextStyle(
                  fontSize: 15,
                  color: primaryTextColor,
                  decoration: TextDecoration.lineThrough),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Số lượng: '),
                Container(
                  padding: const EdgeInsets.all(0),
                  width: 40,
                  height: 23,
                  decoration: const BoxDecoration(
                      // border: Border.all(color: Colors.grey, width: 2),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      cart.quantity.toString(),
                      style: style(16, primaryTextColor, FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]),
  );
}
