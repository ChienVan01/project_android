import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_android/screens/rating/components/detail_rating.dart';
import 'package:project_android/screens/rating/components/rating_tab.dart';

import '../../../constants.dart';

class BodyRating extends StatelessWidget {
  const BodyRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white, // Tab Bar color
          child: const TabBar(
            unselectedLabelColor: primaryTextColor, //màu tab k đc chọn
            labelColor: primaryColor, //màu tab được chọn
            indicatorColor:
                primaryColor, //màu con trỏ, ở đây là cái gạch chân đỏ
            tabs: <Widget>[
              Tab(text: "All"),
              Tab(text: "5 ☆"),
              Tab(text: "4 ☆"),
              Tab(text: "3 ☆"),
              Tab(text: "2 ☆"),
              Tab(text: "1 ☆")
            ],
          ),
        ),
        Expanded(
          child: TabBarView(children: [
            tabRatingWidget(context),
            tabRatingWidget(context),
            tabRatingWidget(context,),
            tabRatingWidget(context),
            tabRatingWidget(context),
            tabRatingWidget(context)
          ]),
        ),
      ],
    );
  }
  
}
