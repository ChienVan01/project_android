import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class FooterDetail extends StatelessWidget {
  const FooterDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 52,
            width: 130.5,
            color: primaryTextColor,
            child: const Icon(Icons.textsms, color: Colors.white),
          ),
          Container(
            height: 52,
            width: 130.5,
            color: primaryTextColor,
            child:
                const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          ),
          Container(
            height: 52,
            width: 130.5,
            color: primaryColor,
            child: const Center(
              child: Text(
                'Mua ngay',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}