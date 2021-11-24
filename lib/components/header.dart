import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class Header extends StatelessWidget {
  const Header(
      {Key? key,
      required this.title,
      required this.backgroundColor,
      required this.textColor})
      : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.navigate_before_outlined, color: textColor, size: 30),
      ),
      title: Container(
        width: 240,
        child: Center(
          child: Text(
            title,
            style: style(22, textColor, FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}

// Widget Header(context, String title, Color color) {
//   return AppBar(
//     leading: IconButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       icon: const Icon(Icons.navigate_before_outlined,
//           color: primaryTextColor, size: 30),
//     ),
//     title: Container(
//       width: 240,
//       child: Center(
//         child: Text(
//           title,
//           style: style(22, primaryTextColor, FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     ),
//     backgroundColor: color,
//   );
// }
