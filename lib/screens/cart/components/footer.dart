import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class FooterCart extends StatelessWidget {
  const FooterCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 63,
          padding: const EdgeInsets.all(defaultPadding / 2),
          width: MediaQuery.of(context).size.width * 0.666,
          color: Colors.white,
          child: Row(children: <Widget>[
            Text('Tổng tiền: ',
                style: style(15, primaryTextColor, FontWeight.normal)),
            Text('100000', style: style(20, primaryColor, FontWeight.bold)),
          ]),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(defaultPadding),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          child: Text(
            'Mua hàng',
            style: style(20, backgroundColor, FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
