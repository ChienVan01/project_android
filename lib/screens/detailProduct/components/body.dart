import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/screens/detailProduct/components/img_slider.dart';
import 'package:project_android/screens/detailProduct/components/respect.dart';
import 'package:project_android/screens/detailProduct/components/specifications.dart';
import 'package:project_android/screens/detailProduct/components/title_product.dart';

class BodyProduct extends StatelessWidget {
  const BodyProduct({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: defaultPadding / 2),
      color: backgroundColor,
      child: ListView(
        children: [
          ImgSlider(product: product),
          TitleProduct(product: product),
          const Specifications(),
          Respect(product: product),
          // FooterDetail(),
        ],
      ),
    );
  }
}
