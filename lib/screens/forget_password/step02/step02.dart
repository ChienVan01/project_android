import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class ForgotPassStep2 extends StatelessWidget {
  const ForgotPassStep2({Key? key}) : super(key: key);

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
        child: Center(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/svg/logoGmail.svg',
                width: 100,
              ),
              const SizedBox(height: defaultPadding),
              Text('Kiểm tra Email của pạn',
                  style: style(24, primaryTextColor, FontWeight.bold)),
              const SizedBox(height: defaultPadding),
              Text('Chúng tôi đã gửi mật khẩu khôi phục vào Email của bạn',
                  textAlign: TextAlign.center,
                  style: style(18, primaryTextColor, FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }
}
