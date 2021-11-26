import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

Widget footerButton() {

 return Padding(
   padding: const EdgeInsets.only(left:defaultPadding/2,right:defaultPadding/2),
   child: SizedBox(
     width:400,
     child: ElevatedButton(
          onPressed: (){},
          child:const Text("Đăng Xuất"),
      ),
   ),
 );
}


