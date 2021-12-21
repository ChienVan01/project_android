import 'package:flutter/material.dart';
import 'package:project_android/screens/product/components/body.dart';
import 'package:project_android/screens/product/components/header_product.dart';
import 'package:provider/provider.dart';

import 'components/product_provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

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
          appBar: PreferredSize(
            child: headerProduct(context),
            preferredSize: const Size(double.infinity, 85),
          ),
          body: const ListProduct(),
        ));
  }
}
