import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class ForgotPassStep2 extends StatelessWidget {
  const ForgotPassStep2({Key? key}) : super(key: key);

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
