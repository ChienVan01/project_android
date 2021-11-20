import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account/components/order/components/detail_order.dart';


class CancelledOrderScreen extends StatelessWidget {
  const CancelledOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(
       top:  defaultPadding / 2),
      child: ListView(
        children: [
          detailOrderWidget("product02.jpg",
          "Laptop Gaming Lenovo",
          1,"19.900.000đ",
          "Đã hủy bởi bạn",
          "Mua Lại"),
         
        ],
      ),
    );
  }
}
