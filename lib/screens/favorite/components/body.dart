import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/favorite/components/product_item.dart';
import 'package:project_android/screens/favorite/components/tabbar.dart';

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
                  productItem(
                      title: 'Laptop Dell Alienware 1..',
                      image: 'product05.jpg',
                      price: 62990000),
                  productItem(
                      title: 'Laptop Dell Alienware 2..',
                      image: 'product03.jpg',
                      price: 62990000),
                  productItem(
                      title: 'Laptop Dell Alienware 3..',
                      image: 'product04.jpg',
                      price: 62990000),
                  productItem(
                      title: 'Laptop Dell Alienware 4..',
                      image: 'product02.jpg',
                      price: 62990000),
                  productItem(
                      title: 'Laptop Dell Alienware 4..',
                      image: 'product02.jpg',
                      price: 62990000),
                  productItem(
                      title: 'Laptop Dell Alienware 4..',
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

