import 'package:intl/intl.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        product(context),
        product(context),
        product(context),
        product(context),
        product(context),
      ],
    );
  }
}

Widget product(context) {
  return Container(
    height: 120,
    color: Colors.white,
    padding: const EdgeInsets.all(defaultPadding / 4),
    margin: const EdgeInsets.only(bottom: defaultPadding),
    child: Row(children: <Widget>[
      Image.asset('assets/images/product/image1.jpg', width: 120),
      // SizedBox(width: 120, child: Text(widget.cart.avatar)),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "widget.cart.name",
              style: style(16, primaryTextColor, FontWeight.bold),
            ),
            Text(
              'SKU: 1810470',
              style: style(14, Colors.black45, FontWeight.normal),
            ),
            Text(
              NumberFormat.decimalPattern().format(100000) + 'đ',
              style: style(16, primaryColor, FontWeight.bold),
            ),
            Text(
              NumberFormat.decimalPattern().format(1000000 * 1.1) + 'đ',
              style: const TextStyle(
                  fontSize: 15,
                  color: primaryTextColor,
                  decoration: TextDecoration.lineThrough),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(0),
                    width: 40,
                    height: 23,
                    decoration: const BoxDecoration(
                        // border: Border.all(color: Colors.grey, width: 2),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        "4",
                        style: style(16, primaryTextColor, FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]),
  );
}
