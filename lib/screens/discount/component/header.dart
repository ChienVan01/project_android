import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';

Widget header() {
  return AppBar(
    title: const Text(
      'Khuyến Mãi',
      style: TextStyle(color: backgroundColor, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    backgroundColor: primaryColor,
  );
}

void _test() {
  //nothing to do
}
