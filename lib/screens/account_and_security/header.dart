import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget header(String text,context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: primaryColor,
      title:  Text(text),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios) //phím quay lại screen trước
          ),
    ),
    
  );
}
