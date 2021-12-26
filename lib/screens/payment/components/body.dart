import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_android/screens/payment/components/transport_unit.dart';
import 'package:project_android/screens/payment/components/list_product.dart';

class BodyPayment extends StatelessWidget {
  const BodyPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return GFListTile(
          titleText: "ewewweweq",
          subTitleText: "ewqewqewqe",
          onTap: () {},
        );
      },
    );
  }
}
