import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/product/components/navbar.dart';

class ProductData {
  String name;
  double price;
  String image;

  ProductData({required this.name, required this.price, required this.image});
}

final List<ProductData> _product = [
  ProductData(
    name: 'Laptop ASUS UX3..',
    image: 'product01.jpg',
    price: 27999000,
  ),
  ProductData(
    name: 'Màn hình LCD PHILIPS..',
    image: 'product02.jpg',
    price: 5050000,
  ),
  ProductData(
    name: 'Lót chuột DAREU ESP1009-XL',
    image: 'product03.jpg',
    price: 189000,
  ),
  ProductData(
    name: 'Bàn phím cơ Akko 3084..',
    image: 'product04.jpg',
    price: 1499000,
  ),
  ProductData(
    name: 'Laptop Dell Alienware..',
    image: 'product05.jpg',
    price: 62990000,
  ),
  ProductData(
    name: 'Laptop ASUS UX3..',
    image: 'product01.jpg',
    price: 27999000,
  ),
  ProductData(
    name: 'Màn hình LCD PHILIPS..',
    image: 'product02.jpg',
    price: 5050000,
  ),
  ProductData(
    name: 'Lót chuột DAREU ESP1009-XL',
    image: 'product03.jpg',
    price: 189000,
  ),
  ProductData(
    name: 'Bàn phím cơ Akko 3084..',
    image: 'product04.jpg',
    price: 1499000,
  ),
  ProductData(
    name: 'Laptop Dell Alienware..',
    image: 'product05.jpg',
    price: 62990000,
  ),
  ProductData(
    name: 'Laptop ASUS UX3..',
    image: 'product01.jpg',
    price: 27999000,
  ),
  ProductData(
    name: 'Màn hình LCD PHILIPS..',
    image: 'product02.jpg',
    price: 5050000,
  ),
  ProductData(
    name: 'Lót chuột DAREU ESP1009-XL',
    image: 'product03.jpg',
    price: 189000,
  ),
  ProductData(
    name: 'Bàn phím cơ Akko 3084..',
    image: 'product04.jpg',
    price: 1499000,
  ),
  ProductData(
    name: 'Laptop Dell Alienware..',
    image: 'product05.jpg',
    price: 62990000,
  ),
];

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Navbar(),
          Expanded(
            child: StaggeredGridView.countBuilder(
              // physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              itemCount: _product.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/productdetail');
                  },
                  child: _productItem(
                    title: _product[index].name,
                    image: _product[index].image,
                    price: _product[index].price,
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
                  const StaggeredTile.count(2, 2.8),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
          )
        ],
      ),
    );
  }
}

Widget _productItem({required String title, image, price}) {
  return Container(
    padding: const EdgeInsets.all(defaultPadding / 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/product/$image',
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '$title',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '${NumberFormat.decimalPattern().format(price)}',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        ),
        Text(
          '${NumberFormat.decimalPattern().format(price * 1.3)}',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 13,
              decoration: TextDecoration.lineThrough),
        ),
      ],
    ),
  );
}
