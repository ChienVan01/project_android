import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.txtBtn, required this.press})
      : super(key: key);
  final String txtBtn, press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: SizedBox(
        width: 350,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, press);
            },
            child: Text(txtBtn)),
      ),
    );
  }
}
