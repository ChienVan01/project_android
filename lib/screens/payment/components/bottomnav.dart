import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Align(
                child: Row(
              children: const [
                Text(
                  "Thành Tiền:  ",
                ),
                Text('1000000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 20,
                    ))
              ],
            )),
          ],
        ),
        Divider(thickness: 1, height: 1),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white38),
            shadowColor: MaterialStateProperty.all(primaryColor),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          ),
          child: Container(
            height: 52,
            width: 130.5,
            color: primaryColor,
            child: const Center(
              child: Text(
                'Thanh Toán',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
