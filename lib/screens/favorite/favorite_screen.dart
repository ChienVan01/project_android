import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/favorite/components/body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key, required this.userId}) : super(key: key);
  final int userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: Header(
              title: "Đã Thích",
              backgroundColor: primaryColor,
              textColor: colorWhite,
              action: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: defaultPadding / 2),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_outlined),
                  ),
                ),
              ])),
      body: Body(userId: userId),
    );
  }
}
