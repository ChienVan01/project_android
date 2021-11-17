import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget banner() {
  return Container(
      height: 170.0,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(7),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: primaryColor.withOpacity(0.3))
          ]),
      child: CarouselSlider(
        items: [
          img('assets/images/banner01.png'),
          img('assets/images/banner02.png'),
          img('assets/images/banner03.png'),
        ],
        options: CarouselOptions(
            height: 150.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.83,
            scrollDirection: Axis.horizontal),
      ));
}

Widget img(String link) {
  return Container(
    // margin: EdgeInsets.all(10),

    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(link),
          fit: BoxFit.cover,
        )),
  );
}
