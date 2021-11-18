import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget appBar(context) {
  return Stack(
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: primaryColor,
      ),
      Container(),
      Positioned(
        // left: 10,
        top: defaultPadding * 4,
        left: defaultPadding,
        right: defaultPadding,
        child: AppBar(
          primary: false,
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.25),
          title: const TextField(
            style: TextStyle(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
                hintText: 'Nhập từ khóa tìm kiếm',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: primaryColor),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ],
  );
}
