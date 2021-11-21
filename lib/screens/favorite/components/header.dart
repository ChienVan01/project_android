import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget headerFavorite(context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: primaryColor,
      title: const Text("Đã Thích"),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios) //phím quay lại screen trước
          ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right:defaultPadding/2),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),       
          ),
        ),
      ],
    ),
  );
}
