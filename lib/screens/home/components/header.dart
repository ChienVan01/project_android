import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget headerHome(context) {
  return Stack(
    children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: primaryColor,
      ),
      // Container(),
      Positioned(
        // left: 10,
        top: defaultPadding * 4,
        left: 0,
        right: defaultPadding,
        child: AppBar(
          primary: false,
          elevation: 0,
          // backgroundColor: Colors.white.withOpacity(0.25),
          title: const TextField(
            style: TextStyle(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
              hintText: 'Nhập từ khóa tìm kiếm',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              fillColor: Colors.white38,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.white38, width: 0.1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.white38, width: 0.1),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: backgroundColor, size: 33),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ],
  );
}
