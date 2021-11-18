import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
          color: primaryColor,
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding / 2),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: new NetworkImage(
                      "http://windows79.com/wp-content/uploads/2021/02/Thay-the-hinh-dai-dien-tai-khoan-nguoi-dung-mac.png"),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    ("Mẫn Trần"),
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  Text(
                    "0962455419",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                ],
              ),
            ],
          )),
      Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Divider(
                thickness: defaultPadding / 2,
                height: defaultPadding / 2,
                color: backgroundColor),
            PageRoute('Đơn Hàng', Icons.receipt_long_outlined,
                Icons.navigate_next_outlined),
            Divider(thickness: 1, height: 1),
            PageRoute('Đã Thích', Icons.favorite_border_outlined,
                Icons.navigate_next_outlined),
            Divider(thickness: 1, height: 1),
            PageRoute('Mã Giảm Giá', Icons.receipt_outlined,
                Icons.navigate_next_outlined)
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Divider(
                thickness: defaultPadding / 2,
                height: defaultPadding / 2,
                color: backgroundColor),
            PageRoute('Đã Xem Gần Đây', Icons.schedule_outlined,
                Icons.navigate_next_outlined),
            Divider(thickness: 1, height: 1),
            PageRoute('Đánh Giá Của Tôi', Icons.star_border_outlined,
                Icons.navigate_next_outlined),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Divider(
                thickness: defaultPadding / 2,
                height: defaultPadding / 2,
                color: backgroundColor),
            PageRoute('Tài Khoản Và Bảo Mật', Icons.lock_outlined,
                Icons.navigate_next_outlined),
            Divider(thickness: 1, height: 1),
            PageRoute('Trung Tâm Hỗ Trợ', Icons.help_outline_outlined,
                Icons.navigate_next_outlined),
          ],
        ),
      )
    ]);
  }
}

Widget PageRoute(String text, IconData iconLeading, IconData iconTraling) {
  return ListTile(
    leading: Icon(
      iconLeading,
    ),
    title: Text("$text"),
    trailing: Icon(iconTraling),
  );
}
