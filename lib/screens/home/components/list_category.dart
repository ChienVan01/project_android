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
            children: const [
              categoryItem(icon: Icon(Icons.laptop), text: 'Laptop'),
              categoryItem(icon: Icon(Icons.monitor), text: 'Màn hình'),
              categoryItem(icon: Icon(Icons.keyboard), text: 'Bàn phím'),
              categoryItem(icon: Icon(Icons.headphones), text: 'Tai nghe'),
              // categoryItem(const Icon(Icons.phonelink), 'PC'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              categoryItem(icon: Icon(Icons.mouse), text: 'Chuột'),
              categoryItem(icon: Icon(Icons.keyboard), text: 'Bàn phím'),
              categoryItem(icon: Icon(Icons.monitor), text: 'Màn hình'),
              categoryItem(icon: Icon(Icons.phonelink), text: 'PC'),
              // categoryItem(const Icon(Icons.headphones), 'Tai nghe'),
            ],
          ),
        ],
      ));
}

class categoryItem extends StatelessWidget {
  const categoryItem({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
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
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/product');
                      },
                      icon: icon),
                ),
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
