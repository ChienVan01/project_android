import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          width: 400,
          height: 150,
          child: Container(
              color: colorWhite,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Icon(
                    Icons.image_outlined,
                    size: 70,
                  ),
                  Text("Ảnh đại diện")
                ]),
              )),
        )
      ],
    ));
  }
}
