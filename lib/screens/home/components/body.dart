import 'package:flutter/widgets.dart';
import 'package:project_android/screens/home/components/banner.dart';
import 'package:project_android/screens/home/components/list_category.dart';
import 'package:project_android/screens/home/components/list_product.dart';

Widget body(context) {
  return ListView(
    children: const <Widget>[
      BannerHome(),
      ListCategory(),
      ListProduct(title: 'Dành cho bạn'),
      ListProduct(title: 'Đề xuất'),
      ListProduct(title: 'Sản phẩm bán chạy'),
    ],
  );
}
