
import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,required this.text,required this.obscureText,
  }) : super(key: key);
final String text;
final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(top:defaultPadding),
      child:  TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
         border: InputBorder.none,
           filled: true,
            fillColor: Colors.white,
          hintText: text,
        ),
        
      ),
    );
  }
}
