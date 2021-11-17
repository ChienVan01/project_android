import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';

Widget navBar() {
  return Container(
    padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
    height: 30,
    color: primaryColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Sắp xếp',
              style: TextStyle(fontSize: 18, color: backgroundColor),
            ),
            Icon(Icons.arrow_drop_down, color: backgroundColor, size: 30),
          ],
        ),
        Row(
          children: const [
            Text(
              'Bộ lọc',
              style: TextStyle(fontSize: 18, color: backgroundColor),
            ),
            Icon(Icons.filter_alt_outlined, color: backgroundColor, size: 25)
          ],
        ),
      ],
    ),
  );
}
