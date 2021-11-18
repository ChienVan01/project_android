import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget headerOrder(context) {
  return DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.navigate_before_outlined),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text('Đơn Hàng'),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(            
              unselectedLabelColor: primaryTextColor, //màu tab k đc chọn
              labelColor: Colors.white, //màu tab được chọn
              indicatorColor: primaryColor, //màu con t
              tabs: [
                Tab(text: "Chờ Lấy"),
                Tab(text: "Đang Giao"),
                Tab(text: "Đã Giao"),
                Tab(text: "Đã Hủy"),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
