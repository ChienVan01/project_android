import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/order/components/cancel_screen.dart';
import 'package:project_android/screens/order/components/delivered_screen.dart';
import 'package:project_android/screens/order/components/inprocess_screen.dart';
import 'package:project_android/screens/order/components/wait_order_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
        const Expanded(
          child: TabBarView(children: [
            WaitOrderScreen(),
            InprocssOrderScreen(),
            DeliveredOrderScreen(),
            CancelledOrderScreen()
          ]),
        ),
      ],
    );
  }
}
