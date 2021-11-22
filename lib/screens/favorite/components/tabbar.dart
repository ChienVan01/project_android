import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';


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
