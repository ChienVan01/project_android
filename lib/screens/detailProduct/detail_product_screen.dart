import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/screens/detailProduct/components/body.dart';
import 'package:project_android/screens/detailProduct/components/footer_detail.dart';
import 'package:project_android/screens/detailProduct/components/header_detail_product.dart';
import 'package:project_android/screens/detailProduct/components/img_slider.dart';
import 'package:project_android/screens/detailProduct/components/title_product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode curentFocus = FocusScope.of(context);
        if (!curentFocus.hasPrimaryFocus) {
          curentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.maxFinite, 70),
            child: HeaderDetailProduct()),
        body: BodyProduct(product: product),
        bottomNavigationBar: FooterDetail(product: product),
      ),
    );
  }
}
