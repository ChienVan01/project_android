import 'package:flutter/material.dart';



class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key, required this.text1,required this.textStyle1,required this.text2,required this.textStyle2,
  }) : super(key: key);
final String text1,text2;
final TextStyle textStyle1,textStyle2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: textStyle1,
        children: [
          TextSpan(
              text:text2,
              style: textStyle2)
        ],
      ),
    );
  }
}

