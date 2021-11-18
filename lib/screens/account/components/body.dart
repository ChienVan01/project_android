import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account/components/directional_item.dart';
import 'package:project_android/screens/account/components/info_user.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      infoUser(),
      directionalItem(),
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
