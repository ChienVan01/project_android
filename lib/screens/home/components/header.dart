import 'package:flutter/material.dart';
import 'package:project_android/components/search_bar.dart';
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
