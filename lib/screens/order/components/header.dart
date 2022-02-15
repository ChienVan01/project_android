import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class HeaderOrder extends StatelessWidget {
  const HeaderOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Đơn Hàng"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.navigate_before_outlined,
                size: 30) //phím quay lại screen trước
            ),
      )),
    );
  }
}
