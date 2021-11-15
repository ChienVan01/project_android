import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget banner() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      height: 165,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 50,
              color: primaryColor.withOpacity(0.7)),
        ],
      ),
      child: Row(
        children: <Widget>[
          img('assets/images/banner01.png'),
          img('assets/images/banner02.png'),
          img('assets/images/banner03.png'),
          // img(),
        ],
      ),
    ),
  );
}

Widget img(String imgLink) {
  return Container(
    margin: const EdgeInsets.all(20),
    alignment: Alignment.center,
    child: Image.asset(
      imgLink,
      width: 350.0,
      alignment: Alignment.center,
    ),
  );
}
