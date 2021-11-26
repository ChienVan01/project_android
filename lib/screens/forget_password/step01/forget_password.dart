import 'package:flutter/material.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: Header(
            title: 'Đặt lại mật khẩu',
            backgroundColor: backgroundColor,
            textColor: primaryTextColor,
            action: null),
        preferredSize: Size(double.infinity, 55),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            top: defaultPadding * 2,
            left: defaultPadding,
            right: defaultPadding),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'SĐT/email',
                hintStyle: style(20, Colors.grey, FontWeight.normal),
                prefixIcon:
                    const Icon(Icons.person_outline, color: Colors.black),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: primaryColor),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
              ),
              cursorColor: Colors.white,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgotpassword/step02');
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(400, 50))),
              child:
                  Text('Tiếp', style: style(20, Colors.white, FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
