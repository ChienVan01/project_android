import 'package:flutter/material.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/screens/detailProduct/components/body.dart';
import 'package:project_android/screens/detailProduct/components/footer_detail.dart';
import 'package:project_android/screens/detailProduct/components/header_detail_product.dart';

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
