import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget appBar(context) {
  return  Scaffold(
    appBar: AppBar(      
      leading: Padding(
        padding: const EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundImage: new NetworkImage(
              "http://windows79.com/wp-content/uploads/2021/02/Thay-the-hinh-dai-dien-tai-khoan-nguoi-dung-mac.png"),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const[
          Text(
            ("Mẫn Trần"),
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          Text(
            "0962455419",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          )
        ],
      ),
      
      actions:  const <Widget>[
        Icon(
          Icons.settings_outlined,
        ),
        Padding( padding: const EdgeInsets.all(5)),
        Icon(
          Icons.shopping_cart_outlined,
        ),
        Padding( padding: const EdgeInsets.all(5)),
        Icon(
          Icons.textsms_outlined,
        ),
        Padding( padding: const EdgeInsets.all(defaultPadding/2)),
        
      ],
    ),
  );
}
