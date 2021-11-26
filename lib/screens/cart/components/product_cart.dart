import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({Key? key}) : super(key: key);

  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  int quantity = 1;

  void Up() {
    setState(() {
      quantity++;
    });
  }

  void Down() {
    setState(() {
      quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        cartItem(),
        cartItem(),
      ],
    );
  }

  Container cartItem() {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(defaultPadding / 2),
        margin: const EdgeInsets.only(top: defaultPadding),
        child: Row(
          children: <Widget>[
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: Colors.black),
              ),
            ),
            Image.asset('assets/images/product/product01.jpg', width: 120),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Laptop Dell Alienware M15 R6 (P109F001ABL) ',
                    style: style(16, primaryTextColor, FontWeight.bold),
                  ),
                  Text(
                    'SKU: 1810470',
                    style: style(14, Colors.black45, FontWeight.normal),
                  ),
                  Text(
                    '1.089.000đ',
                    style: style(16, primaryColor, FontWeight.bold),
                  ),
                  const Text(
                    '1.799.000đ',
                    style: TextStyle(
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
                        if (quantity == 1)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: defaultPadding, right: defaultPadding),
                            child: Text(
                              '-',
                              style: style(
                                  18, Colors.grey.shade300, FontWeight.bold),
                            ),
                          )
                        else
                          ElevatedButton(
                            onPressed: Down,
                            child: Text(
                              '-',
                              style:
                                  style(18, primaryTextColor, FontWeight.bold),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              minimumSize:
                                  MaterialStateProperty.all(const Size(30, 15)),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.all(0),
                          width: 40,
                          height: 23,
                          decoration: const BoxDecoration(
                              // border: Border.all(color: Colors.grey, width: 2),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              '$quantity',
                              style:
                                  style(16, primaryTextColor, FontWeight.bold),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: Up,
                          child: Text(
                            '+',
                            style:
                                style(18, primaryTextColor, FontWeight.normal),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(0),
                            minimumSize:
                                MaterialStateProperty.all(const Size(30, 15)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
