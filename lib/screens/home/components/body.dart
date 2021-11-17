import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';

Widget body() {
  return ListView(
    children: <Widget>[
      SizedBox(
        height: 300,
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: primaryColor.withOpacity(0.7)),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 300,
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: primaryColor.withOpacity(0.7)),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 300,
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: primaryColor.withOpacity(0.7)),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
