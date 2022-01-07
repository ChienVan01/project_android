import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/rating/components/detail_rating.dart';

Widget tabRatingWidget(context) {
  return ListView(children: [
    detailRatingWidget(context, "product01.jpg", 5),
    detailRatingWidget(context, "product02.jpg", 4),
    detailRatingWidget(context, "product03.jpg", 4),
    detailRatingWidget(context, "product04.jpg", 4),
    detailRatingWidget(context, "product05.jpg", 4),
    detailRatingWidget(context, "product01.jpg", 4)
  ]);
}
