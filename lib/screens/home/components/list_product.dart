// ignore_for_file: unnecessary_import, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/detailProduct/detail_product_screen.dart';
import 'package:project_android/screens/product/components/product_provider.dart';
import 'package:project_android/screens/product/product_screen.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductProvider>(context, listen: false);
    products.getProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: defaultPadding / 2,
          right: defaultPadding / 2,
          bottom: defaultPadding),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.title,
                style: const TextStyle(
                    color: primaryTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductScreen(id: '')));
                },
                child: const Text('Xem thêm',
                    style: TextStyle(
                        fontSize: 15,
                        color: primaryColor,
                        fontStyle: FontStyle.italic)),
              )
            ],
          ),
          Consumer<ProductProvider>(builder: (context, state, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: state.products
                      .map((e) => GestureDetector(
                            onTap: () {
                              print(e);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetail(product: e),
                                ),
                              );
                            },
                            child: ProductItem(
                                name: e.name, image: e.avatar, price: e.price),
                          ))
                      .toList()
                  // const [
                  //   ProductItem(
                  //     name: 'Laptop ASUS UX3..',
                  //     image: 'assets/images/product/product01.jpg',
                  //     price: 27999000,
                  //     priceStock: 0,
                  //   ),
                  //   ProductItem(
                  //     name: 'Màn hình LCD PHILIPS..',
                  //     image: 'assets/images/product/product02.jpg',
                  //     price: 5050000,
                  //     priceStock: 0,
                  //   ),
                  //   ProductItem(
                  //     name: 'Lót chuột DAREU ESP1009-XL',
                  //     image: 'assets/images/product/product03.jpg',
                  //     price: 189000,
                  //     priceStock: 0,
                  //   ),
                  //   ProductItem(
                  //     name: 'Bàn phím cơ Akko 3084..',
                  //     image: 'assets/images/product/product04.jpg',
                  //     price: 1499000,
                  //     priceStock: 0,
                  //   ),
                  //   ProductItem(
                  //     name: 'Laptop Dell Alienware..',
                  //     image: 'assets/images/product/product05.jpg',
                  //     price: 62990000,
                  //     priceStock: 0,
                  //   ),
                  // ],
                  ),
            );
          })
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
    // required this.press,
  }) : super(key: key);

  final String name, image;
  final int price;
  // final Function press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 3),
      width: size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.network('http://10.0.2.2/upload/product/$image'),
          ),
          // Image.asset(image),
          Container(
            width: size.width * 0.5,
            height: size.height * 0.13,
            padding: const EdgeInsets.all(defaultPadding / 2),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: name,
                    style:
                        const TextStyle(fontSize: 15, color: primaryTextColor),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: defaultPadding / 2,
                    // bottom: defaultPadding / 2,
                  ),
                  child: Text(
                    NumberFormat.decimalPattern().format(price) + 'đ',
                    style: const TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                    ),
                  ),
                ),
                Text(
                  NumberFormat.decimalPattern().format(price * 1.3),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
