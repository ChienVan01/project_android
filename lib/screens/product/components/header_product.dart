import 'package:flutter/material.dart';
import 'package:project_android/components/search_bar.dart';
import 'package:project_android/constants.dart';

Widget headerProduct(context) {
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
        left: -defaultPadding,
        right: defaultPadding,
        child: AppBar(
          leading: IconButton(
              padding: const EdgeInsets.only(left: 25),
              icon: const Icon(Icons.navigate_before_outlined, size: 30),
              onPressed: () {
                Navigator.pop(context);
              }),
          primary: false,
          elevation: 0,
          // backgroundColor: Colors.white.withOpacity(0.25),
          title: SearchBar(),
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
