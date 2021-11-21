import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';

Widget infoUser() {
  return Container(
      color: primaryColor,
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding / 2),
            child: CircleAvatar(
              radius: 40,
              // backgroundImage: new NetworkImage(
              //     "http://windows79.com/wp-content/uploads/2021/02/Thay-the-hinh-dai-dien-tai-khoan-nguoi-dung-mac.png"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                ("Mẫn Trần"),
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              Text(
                "0962455419",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )
            ],
          ),
        ],
      ));
}
