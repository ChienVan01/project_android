import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';

class Header extends StatelessWidget {
  const Header(
      {Key? key,
      required this.title,
      required this.backgroundColor,
      required this.textColor,
      required this.action})
      : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color textColor;
  final List<Widget>? action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.navigate_before_outlined, color: textColor, size: 30),
      ),
      title: Text(
        title,
        style: style(22, textColor, FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      actions: action,
      backgroundColor: backgroundColor,
    );
  }
}