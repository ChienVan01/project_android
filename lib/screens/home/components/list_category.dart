import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget listCategory() {
  return Container(
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Danh mục',
            style: TextStyle(
                fontSize: 22,
                color: primaryTextColor,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              categoryItem(const Icon(Icons.laptop), 'Laptop'),
              categoryItem(const Icon(Icons.monitor), 'Màn hình'),
              categoryItem(const Icon(Icons.keyboard), 'Bàn phím'),
              categoryItem(const Icon(Icons.headphones), 'Tai nghe'),
              // categoryItem(const Icon(Icons.phonelink), 'PC'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              categoryItem(const Icon(Icons.mouse), 'Chuột'),
              categoryItem(const Icon(Icons.keyboard), 'Bàn phím'),
              categoryItem(const Icon(Icons.monitor), 'Màn hình'),
              categoryItem(const Icon(Icons.phonelink), 'PC'),
              // categoryItem(const Icon(Icons.headphones), 'Tai nghe'),
            ],
          ),
        ],
      ));
}

Widget categoryItem(Icon icon, String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: 60,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              height: 45,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 0.5),
                ],
              ),
              child: IconButton(onPressed: () {}, icon: icon),
            ),
          ),
          Text(text)
        ],
      ),
    ),
  );
}
