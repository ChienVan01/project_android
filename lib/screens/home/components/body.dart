import 'package:flutter/widgets.dart';
import 'package:project_android/screens/home/components/banner.dart';
import 'package:project_android/screens/home/components/list_category.dart';
import 'package:project_android/screens/home/components/list_product.dart';


Widget body(context) {
  return ListView(
    children: <Widget>[
      banner(),
      listCategory(),
      const ListProduct(title: 'Dành cho bạn'),
      const ListProduct(title: 'Đề xuất'),
      const ListProduct(title: 'Sản phẩm bán chạy'),
    ],
  );
}
