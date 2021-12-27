import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';

Widget header(context) {
  return AppBar(
    leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios) //phím quay lại screen trước
        ),
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
