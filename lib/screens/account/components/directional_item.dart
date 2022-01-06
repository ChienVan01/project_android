import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';

Widget directionalItem() {
  return Column(
    children: [
      Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: const <Widget>[
            Divider(
                thickness: defaultPadding / 2,
                height: defaultPadding / 2,
                color: backgroundColor),
            PageRoute(
                text: 'Đơn Hàng',
                iconLeading: Icons.receipt_long_outlined,
                iconTraling: Icons.navigate_next_outlined,
                press: '/order'),
            Divider(thickness: 1, height: 1),
            PageRoute(
                text: 'Đã Thích',
                iconLeading: Icons.favorite_border_outlined,
                iconTraling: Icons.navigate_next_outlined,
                press: '/favorite'),
            Divider(thickness: 1, height: 1),
            PageRoute(
                text: 'Mã Giảm Giá',
                iconLeading: Icons.receipt_outlined,
                iconTraling: Icons.navigate_next_outlined,
                press: '/account/components/order')
          ],
        ),
      ),
      Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: const <Widget>[
            Divider(
                thickness: defaultPadding / 2,
                height: defaultPadding / 2,
                color: backgroundColor),
            PageRoute(
                text: 'Đã Xem Gần Đây',
                iconLeading: Icons.schedule_outlined,
                iconTraling: Icons.navigate_next_outlined,
                press: '/account/components/order'),
            Divider(thickness: 1, height: 1),
            PageRoute(
                text: 'Đánh Giá Của Tôi',
                iconLeading: Icons.star_border_outlined,
                iconTraling: Icons.navigate_next_outlined,
                press: '/rating'),
          ],
        ),
      ),
      Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: const <Widget>[
            Divider(
                thickness: defaultPadding / 2,
                height: defaultPadding / 2,
                color: backgroundColor),
            PageRoute(
                text: 'Tài Khoản Và Bảo Mật',
                iconLeading: Icons.lock_outlined,
                iconTraling: Icons.navigate_next_outlined,
                press: '/account_and_security'),
            Divider(thickness: 1, height: 1),
            PageRoute(
                text: 'Trung Tâm Hỗ Trợ',
                iconLeading: Icons.help_outline_outlined,
                iconTraling: Icons.navigate_next_outlined,
                press: '/account_and_security/support'),
          ],
        ),
      )
    ],
  );
}

class PageRoute extends StatelessWidget {
  const PageRoute({
    Key? key,
    required this.text,
    required this.iconLeading,
    required this.iconTraling,
    required this.press,
  }) : super(key: key);

  final String text, press;
  final IconData iconLeading, iconTraling;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          iconLeading,
        ),
        title: Text(text),
        trailing: Icon(iconTraling),
        onTap: () {
          Navigator.pushNamed(context, press);
        });
  }
}
