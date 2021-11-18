import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';

Widget directionalItem() {
  return Column(
    children: [
      Container(
        decoration:const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
           const Divider(
                thickness: defaultPadding / 2,
                height: defaultPadding / 2,
                color: backgroundColor),
            pageRoute('Đơn Hàng', Icons.receipt_long_outlined,
                Icons.navigate_next_outlined),
           const Divider(thickness: 1, height: 1),
            pageRoute('Đã Thích', Icons.favorite_border_outlined,
                Icons.navigate_next_outlined),
           const Divider(thickness: 1, height: 1),
            pageRoute(
                'Mã Giảm Giá', Icons.receipt_outlined, Icons.navigate_next_outlined)
          ],
        ),
      ),
      Container(
         decoration:const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const Divider(thickness:defaultPadding/2,height:defaultPadding/2,color:backgroundColor),
            pageRoute('Đã Xem Gần Đây', Icons.schedule_outlined,
                Icons.navigate_next_outlined),
              const Divider(thickness: 1 ,height: 1),
            pageRoute('Đánh Giá Của Tôi', Icons.star_border_outlined,
                Icons.navigate_next_outlined), 
          ],     
        ),
      ),
      Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const Divider(thickness:defaultPadding/2,height:defaultPadding/2,color:backgroundColor),
            pageRoute('Tài Khoản Và Bảo Mật', Icons.lock_outlined,
                Icons.navigate_next_outlined),
            const Divider(thickness: 1 ,height: 1),
            pageRoute('Trung Tâm Hỗ Trợ', Icons.help_outline_outlined,
                Icons.navigate_next_outlined), 
          ],     
        ),
      )
    ],
  );
}

Widget pageRoute(String text, IconData iconLeading, IconData iconTraling) {
  return ListTile(
    leading: Icon(
      iconLeading,
    ),
    title: Text(text),
    trailing: Icon(iconTraling),
  );
}
