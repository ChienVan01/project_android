import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget headerAccount(context) {
  return Scaffold(  
    appBar: AppBar(
      elevation:0,
      actions: const <Widget>[
        Icon(
          Icons.settings_outlined,
        ),
        Padding(padding: EdgeInsets.all(5)),
        Icon(
          Icons.shopping_cart_outlined,
        ),
        Padding(padding: EdgeInsets.all(5)),
        Icon(
          Icons.textsms_outlined,
        ),
        Padding(padding: EdgeInsets.all(defaultPadding / 2)),
      ],
     
    ),
  );
}
