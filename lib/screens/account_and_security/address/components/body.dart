import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';

import '../../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Header(
              title: 'Sửa địa chỉ',
              backgroundColor: primaryColor,
              textColor: colorWhite,
              action: <Widget>[
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Lưu"),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                    ))
              ]),
          preferredSize: const Size(double.infinity, 55),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: "Nhập vào đây",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: colorBorder),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                        )),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Text("dưới 100 kí tự"),
              )
            ]));
  }
}
