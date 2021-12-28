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
        top: defaultPadding * 2,
        left: 0,
        right: defaultPadding / 2,
        child: AppBar(
          centerTitle: true,
          primary: false,
          elevation: 0,
          // backgroundColor: Colors.white.withOpacity(0.25),
          title: const SearchBar(),
        ),
      ),
    ],
  );
}
