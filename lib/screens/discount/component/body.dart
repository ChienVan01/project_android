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
          ListView.builder(
              itemCount: _discount.length,
              itemBuilder: (context, index) {
                return GFListTile(
                    avatar: Image.asset(_discount[index].logo,
                        width: 60, height: 60),
                    titleText: _discount[index].title,
                    subTitleText: "HSD: " +
                        _discount[index].expiredDate.day.toString() +
                        "/" +
                        _discount[index].expiredDate.month.toString() +
                        "/" +
                        _discount[index].expiredDate.year.toString(),
                    onTap: () {},
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    margin: const EdgeInsets.only(
                        top: 7.0, bottom: defaultPadding / 4),
                    color: Colors.white);
              }),
          ListView.builder(
              itemCount: _discount.length,
              itemBuilder: (context, index) {
                return GFListTile(
                    avatar: Image.asset(_discount[index].logo,
                        width: 60, height: 60),
                    titleText: _discount[index].title,
                    subTitleText: "HSD: " +
                        _discount[index].expiredDate.day.toString() +
                        "/" +
                        _discount[index].expiredDate.month.toString() +
                        "/" +
                        _discount[index].expiredDate.year.toString(),
                    onTap: () {},
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    margin: const EdgeInsets.only(
                        top: 7.0, bottom: defaultPadding / 4),
                    color: Colors.white);
              })
        ]),
      ),
    ],
  );
}

//Widget tab() {

//}

class Discount {
  String title;
  DateTime expiredDate;
  String desc;
  String logo;
  Discount(
      {required this.title,
      required this.expiredDate,
      required this.desc,
      required this.logo});
}

final List<Discount> _discount = [
  Discount(
      title: "Giảm giá 10% các sản phẩm dòng G",
      expiredDate: DateTime.utc(2021, 11, 30),
      desc:
          "Từ ngày 15 đến hết ngày 30/11/2021, giảm 10% cho các sản phẩm dòng "
          "G của Logitech tại ShopGear",
      logo: "assets/images/producer_logo/logo1.png"),
  Discount(
      title: "Giảm giá 12,5% cho bàn phím Logitech",
      expiredDate: DateTime.utc(2021, 12, 10),
      desc: "Từ ngày 1 đến 10/12/2021, giảm 10% cho các sản phẩm bàn phím "
          " của Logitech tại ShopGear",
      logo: "assets/images/producer_logo/logo1.png"),
  Discount(
      title: "Giảm giá 15% các sản phẩm Razer",
      expiredDate: DateTime.utc(2021, 11, 30),
      desc: "Từ ngày 15 đến hết ngày 30/11/2021, giảm 10% cho các sản phẩm "
          " của Razer tại ShopGear",
      logo: "assets/images/producer_logo/logo3.jpg"),
  Discount(
      title: "Giảm giá 11% các sản phẩm ROG",
      expiredDate: DateTime.utc(2021, 11, 30),
      desc: "Từ ngày 15 đến hết ngày 30/11/2021, giảm 10% cho các sản phẩm "
          " của ROG tại ShopGear",
      logo: "assets/images/producer_logo/logo2.jpg"),
  Discount(
      title: "Giảm giá 15% các sản phẩm Razer",
      expiredDate: DateTime.utc(2021, 11, 30),
      desc: "Từ ngày 15 đến hết ngày 30/11/2021, giảm 10% cho các sản phẩm "
          " của Razer tại ShopGear",
      logo: "assets/images/producer_logo/logo3.jpg"),
  Discount(
      title: "Giảm giá 15% các sản phẩm Corsair",
      expiredDate: DateTime.utc(2021, 11, 30),
      desc: "Từ ngày 15 đến hết ngày 30/11/2021, giảm 10% cho các sản phẩm "
          " của Corsair tại ShopGear",
      logo: "assets/images/producer_logo/logo4.png"),
];
