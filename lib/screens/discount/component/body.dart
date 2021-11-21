import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

Widget body(context) {
  return Column(
    children: <Widget>[
      Container(
        color: backgroundColor, // Tab Bar color change
        child: const TabBar(
          unselectedLabelColor: primaryTextColor, //màu tab k đc chọn
          labelColor: primaryColor, //màu tab được chọn
          indicatorColor: primaryColor, //màu con trỏ, ở đây là cái gạch chân đỏ
          tabs: <Widget>[
            Tab(
              text: "Nổi bật",
            ),
            Tab(
              text: "Số lượng có hạn",
            ),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: TabBarView(children: [
          tab(14, 'assets/images/logo_chu_s.png', 'Khuyến Mãi',
              'HSD: 21/11/2021', _test),
          tab(13, 'assets/images/logo_chu_s.png', 'Khuyến Mãi',
              'HSD: 21/11/2021', _test),
        ]),
      ),
    ],
  );
}

Widget tab(
    int item, String avatar, String title, String subtitle, Function func) {
  return Center(
    child: ListView.builder(
      itemCount: item,
      itemBuilder: (context, index) {
        return GFListTile(
            avatar: Image.asset(avatar, width: 60, height: 60),
            titleText: title,
            subTitleText: subtitle,
            onTap: func(),
            padding: const EdgeInsets.all(defaultPadding / 2),
            margin: const EdgeInsets.only(top: 7.0, bottom: defaultPadding / 4),
            color: Colors.white);
      },
    ),
  );
}

void _test() {
  //nothing to do
}
