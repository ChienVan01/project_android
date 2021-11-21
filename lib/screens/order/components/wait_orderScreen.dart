import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/order/components/detail_order.dart';


class WaitOrderScreen extends StatelessWidget {
  const WaitOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(
       top:  defaultPadding / 2),
      child: ListView(
        children: [
          detailOrderWidget("product01.jpg",
          "Chuột Gaming Logitec G502 (Đen)",
          1,"19.900.000đ",
          "Chờ xác nhận",
          "Hủy Đơn Hàng"),
         
        ],
      ),
    );
  }
}
