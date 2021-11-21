import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

Widget body(context) {
  return Column(children: <Widget>[
    Container(
        color: backgroundColor, // Tab Bar color change
        child: Column(
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () => {},
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: const <Widget>[
                    Icon(Icons.check_box_rounded),
                    Text("Đánh dấu đã đọc")
                  ],
                ),
              ),
            )
          ],
        )),
    Expanded(
      flex: 2,
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return GFListTile(
              avatar: Image.asset('assets/images/logo_chu_s.png',
                  width: 60, height: 60),
              titleText: 'ShopGear Tri Ân',
              subTitleText: 'Ngày gửi: 21/11/2021',
              icon: const Icon(
                Icons.notifications_active,
                color: primaryColor,
              ),
              onTap: _test,
              padding: const EdgeInsets.all(defaultPadding / 2),
              margin:
                  const EdgeInsets.only(top: 7.0, bottom: defaultPadding / 4),
              color: Colors.white);
        },
      ),
    ),
  ]);
}

void _test() {
  //nothing to do
}
