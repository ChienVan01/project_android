import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                children: const <Widget>[
                  item(),
                  item(),
                  item(),
                  item(),
                  item(),
                  item(),
                  item(),
                  item(),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class item extends StatelessWidget {
  const item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: colorWhite,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
             Image.asset(
                  'assets/images/product/product02.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
          ],
        ),
      ),
    );
  }
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
