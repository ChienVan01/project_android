import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/product/components/list_product.dart';
import 'package:project_android/screens/product/components/navbar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            navBar(),
            const ListProduct(),
          ],
        ),
        // color: backgroundColor,
      ),
    );
    ;
  }
}
