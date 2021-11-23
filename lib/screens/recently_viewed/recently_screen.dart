import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/recently_viewed/components/body.dart';

class Recently extends StatelessWidget {
  const Recently({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.navigate_before_outlined,
              color: backgroundColor, size: 30),
        ),
        title: Container(
          width: 240,
          child: Center(
            child: Text(
              'Đã xem gần đây',
              style: style(22, backgroundColor, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: const BodyRecently(),
    );
  }
}
