// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/order/components/cancel_screen.dart';
import 'package:project_android/screens/order/components/delivered_screen.dart';
import 'package:project_android/screens/order/components/inprocess_screen.dart';
import 'package:project_android/screens/order/components/wait_order_screen.dart';

class BodyOrder extends StatelessWidget {
  BodyOrder({Key? key, required this.userId}) : super(key: key);
  String userId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white, // Tab Bar color
          child: const TabBar(
            unselectedLabelColor: primaryTextColor, //màu tab k đc chọn
            labelColor: primaryColor, //màu tab được chọn
            indicatorColor:
                primaryColor, //màu con trỏ, ở đây là cái gạch chân đỏ
            tabs: <Widget>[
              Tab(text: "Chờ lấy"),
              Tab(text: "Đang giao"),
              Tab(text: "Đã lấy"),
              Tab(text: "Đã hủy"),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(children: [
            WaitOrderScreen(userId: userId),
            InprocssOrderScreen(userId: userId),
            DeliveredOrderScreen(userId: userId),
            CancelledOrderScreen(userId: userId)
          ]),
        ),
      ],
    );
  }
}
