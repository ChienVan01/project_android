import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios) //phím quay lại screen trước
          ),
      title: const Text(
        'Thanh Toán',
        style: TextStyle(color: backgroundColor, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: primaryColor,
    );
  }
}
