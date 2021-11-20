import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class HeaderDetailProduct extends StatelessWidget {
  const HeaderDetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.navigate_before_outlined, size: 30)),
      title: const TextField(
        style: TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          hintText: 'Tìm kiếm',
          prefixIcon: Icon(Icons.search),
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          fillColor: Colors.white38,
          filled: true,
        ),
      ),
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {}),
        Padding(
          padding: const EdgeInsets.only(right: defaultPadding / 2),
          child: IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
