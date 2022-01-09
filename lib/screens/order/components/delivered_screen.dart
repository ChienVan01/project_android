import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

import 'detail_order.dart';

class DeliveredOrderScreen extends StatelessWidget {
  const DeliveredOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(top: defaultPadding / 2),
      child: ListView(
        children: [
          detailOrderWidget(
              context,
              "product02.jpg",
              "Chuột Gaming Logitec G502 (Đen)",
              1,
              "19.900.000đ",
              "Giao hàng thành công",
              "Đánh Giá",
              ''),
        ],
      ),
    );
  }
}
