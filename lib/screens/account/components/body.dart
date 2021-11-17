import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageRoute('Don Hang',Icons.receipt_long_outlined,Icons.navigate_next_outlined),
        PageRoute('Don Hang',Icons.receipt_long_outlined,Icons.navigate_next_outlined)
        PageRoute('Don Hang',Icons.receipt_long_outlined,Icons.navigate_next_outlined)
      ]
    );
  }
}

Widget PageRoute(String text ,IconData iconLeading,IconData iconTraling ){
  return ListTile(
      leading: Icon(
       iconLeading,
      ),
      title: Text("$text"),
      trailing: Icon(
        iconTraling
      ),
    );
}   //Icons.receipt_long_outlined,Icons.navigate_next_outlined,