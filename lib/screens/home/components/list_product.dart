import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: defaultPadding, right: defaultPadding, bottom: defaultPadding),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                    color: primaryTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Xem thêm',
                    style: TextStyle(
                        fontSize: 15,
                        color: primaryColor,
                        fontStyle: FontStyle.italic)),
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ProductItem(
                    name: 'Laptop ASUS UX3..',
                    image: 'assets/images/product/product01.jpg',
                    price: 27999000,
                    priceStock: 0,
                    press: () {}),
                ProductItem(
                    name: 'Màn hình LCD PHILIPS..',
                    image: 'assets/images/product/product02.jpg',
                    price: 5050000,
                    priceStock: 0,
                    press: () {}),
                ProductItem(
                    name: 'Lót chuột DAREU ESP1009-XL',
                    image: 'assets/images/product/product03.jpg',
                    price: 189000,
                    priceStock: 0,
                    press: () {}),
                ProductItem(
                    name: 'Bàn phím cơ Akko 3084..',
                    image: 'assets/images/product/product04.jpg',
                    price: 1499000,
                    priceStock: 0,
                    press: () {}),
                ProductItem(
                    name: 'Laptop Dell Alienware..',
                    image: 'assets/images/product/product05.jpg',
                    price: 62990000,
                    priceStock: 0,
                    press: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
    required this.priceStock,
    required this.press,
  }) : super(key: key);

  final String name, image;
  final int price, priceStock;
  final Function press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 3),
      width: size.width * 0.4,
      child: GestureDetector(
        onTap: press(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(image),
            ),
            // Image.asset(image),
            Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: name,
                          style: const TextStyle(
                              fontSize: 15, color: primaryTextColor),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: defaultPadding / 2,
                      bottom: defaultPadding / 2,
                    ),
                    child: Text(
                      NumberFormat.decimalPattern().format(price),
                      style: const TextStyle(
                        fontSize: 15,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
