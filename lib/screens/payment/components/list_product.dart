import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

Widget body(context) {
  return Column(children: <Widget>[
    Expanded(
      flex: 2,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return GFListTile(
            avatar: Image.asset("", width: 60, height: 60),
            titleText: "eqwewqeq",
            subTitleText: "qưeeqwewqe",
            onTap: () {},
            padding: const EdgeInsets.all(defaultPadding / 2),
            margin: const EdgeInsets.only(top: 7.0, bottom: defaultPadding / 4),
          );
        },
      ),
    ),
  ]);
}
