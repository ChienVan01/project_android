import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.navigate_before_outlined,
              color: primaryTextColor, size: 30),
        ),
        title: Container(
          width: 240,
          child: Center(
            child: Text(
              'Đặt lại mật khẩu',
              style: style(22, primaryTextColor, FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: backgroundColor,
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