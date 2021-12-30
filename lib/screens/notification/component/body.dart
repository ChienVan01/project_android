import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:math';

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
        itemCount: _notification.length,
        itemBuilder: (context, index) {
          return GFListTile(
              avatar:
                  Image.asset(_notification[index].logo, width: 60, height: 60),
              titleText: _notification[index].title,
              subTitleText: 'Ngày gửi: 21/11/2021',
              icon: (_notification[index].readStatus == true
                  ? const Icon(Icons.check_circle_outline_outlined,
                              color: Colors.green, size: 15)
                  : const Icon(Icons.notifications_active, 
                              color: Colors.red, size: 15)),
              onTap: _test,
              padding: const EdgeInsets.all(defaultPadding / 2),
              margin:
                  const EdgeInsets.only(top: 7.0, bottom: defaultPadding / 4),
              color: (_notification[index].readStatus == true
                  ? Colors.white
                  : Colors.grey.shade300));
        },
      ),
    ),
  ]);
}

void _test() {
  //nothing to do
}

class Notification {
  String title;
  DateTime dateReceived;
  String desc;
  String logo;
  bool readStatus;
  Notification(
      {required this.title,
      required this.dateReceived,
      required this.desc,
      required this.logo,
      required this.readStatus});
}

final List<Notification> _notification = [
  Notification(
    title: "ShopGear Tri Ân",
    dateReceived: DateTime.utc(2021, 11, 29),
    desc:
        "Từ ngày 1 đến hết ngày 7/12/2021, giảm 10% giá trị đơn cho quý khách "
        "mua hàng trực tiếp tại ShopGear",
    logo: "assets/images/logo_chu_s.png",
    readStatus: Random().nextBool(),
  ),
  Notification(
    title: "ShopGear Tri Ân",
    dateReceived: DateTime.utc(2021, 11, 29),
    desc:
        "Từ ngày 1 đến hết ngày 7/12/2021, giảm 10% giá trị đơn cho quý khách "
        "mua hàng trực tiếp tại ShopGear",
    logo: "assets/images/logo_chu_s.png",
    readStatus: Random().nextBool(),
  ),
  Notification(
    title: "ShopGear Tri Ân",
    dateReceived: DateTime.utc(2021, 11, 29),
    desc:
        "Từ ngày 1 đến hết ngày 7/12/2021, giảm 10% giá trị đơn cho quý khách "
        "mua hàng trực tiếp tại ShopGear",
    logo: "assets/images/logo_chu_s.png",
    readStatus: Random().nextBool(),
  ),
  Notification(
    title: "Quà tặng từ Logitech",
    dateReceived: DateTime.utc(2021, 11, 29),
    desc:
        "Từ ngày 1 đến hết ngày 7/12/2021, quý khách có cơ hội nhận Chuột Logitech"
        " G502 Hero K/DA khi có đơn hàng trị giá trên 3.000.000đ và có ít nhất 1 sản phẩm "
        "thuộc về Logitech",
    logo: "assets/images/producer_logo/logo1.png",
    readStatus: Random().nextBool(),
  ),
  Notification(
    title: "ShopGear Tri Ân",
    dateReceived: DateTime.utc(2021, 11, 29),
    desc:
        "Từ ngày 1 đến hết ngày 7/12/2021, giảm 10% giá trị đơn cho quý khách "
        "mua hàng trực tiếp tại ShopGear",
    logo: "assets/images/logo_chu_s.png",
    readStatus: Random().nextBool(),
  ),
  Notification(
    title: "ShopGear Tri Ân",
    dateReceived: DateTime.utc(2021, 11, 29),
    desc:
        "Từ ngày 1 đến hết ngày 7/12/2021, giảm 10% giá trị đơn cho quý khách "
        "mua hàng trực tiếp tại ShopGear",
    logo: "assets/images/logo_chu_s.png",
    readStatus: Random().nextBool(),
  ),
];
