import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView(children: <Widget>[
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  TabWidget(
                      width: 40,
                      height: 50,
                      text: Text('tất cả'),
                      icon: SizedBox()),
                  TabWidget(
                      width: 75,
                      height: 50,
                      text: Flexible(child: Text('Trạng Thái')),
                      icon: Icon(Icons.expand_more_outlined)),
                  TabWidget(
                      width: 40,
                      height: 50,
                      text: Text('tất cả'),
                      icon: SizedBox()),
                  TabWidget(
                      width: 75,
                      height: 50,
                      text: Flexible(child: Text('Nghành Hàng')),
                      icon: Icon(Icons.expand_more_outlined)),
                ]),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding / 2),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  _productItem(
                      title: 'Laptop Dell Alienware..',
                      image: 'product05.jpg',
                      price: 62990000),
                  _productItem(
                      title: 'Laptop Dell Alienware..',
                      image: 'product03.jpg',
                      price: 62990000),
                  _productItem(
                      title: 'Laptop Dell Alienware..',
                      image: 'product04.jpg',
                      price: 62990000),
                  _productItem(
                      title: 'Laptop Dell Alienware..',
                      image: 'product02.jpg',
                      price: 62990000),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

Widget _productItem({required String title, image, price}) {
  return Container(
    width: 180.0,
    height: 200,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: colorWhite,
    ),
    child: Column(
      children: <Widget>[
        Image.asset(
          'assets/images/product/product02.jpg',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 8,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Column(children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold) ,
            ),
            Text(
              '${NumberFormat.decimalPattern().format(price)}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: primaryColor),
            ),
            Text(
              '${NumberFormat.decimalPattern().format(price * 1.3)}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 13,
                  decoration: TextDecoration.lineThrough),
            ),
          ]),
        )
      ],
    ),
  );
}

class TabWidget extends StatelessWidget {
  const TabWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.width,
      required this.height})
      : super(key: key);

  final double width;
  final double height;
  final Widget text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ElevatedButton(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(primaryTextColor),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  side: BorderSide(color: primaryColor)))),
          onPressed: () {},
          child: SizedBox(
            width: width,
            height: height,
            child: Row(
              children: <Widget>[
                text,
                icon,
              ],
            ),
          ))
    ]);
  }
}
