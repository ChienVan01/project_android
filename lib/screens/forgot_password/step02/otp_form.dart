// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/model/user.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  TextEditingController opt1 = TextEditingController();
  TextEditingController opt2 = TextEditingController();
  TextEditingController opt3 = TextEditingController();
  TextEditingController opt4 = TextEditingController();
  UserProfile user = UserProfile(
      id: 0,
      email: '',
      password: '',
      name: '',
      phone: '',
      address: '',
      avatar: '',
      otp: "",
      tokenUser: '',
      status: 0);
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();

    refreshNote();
  }

  Future refreshNote() async {
    user = await DBConfig.instance.getUserOPT();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    refreshNote();
    return Form(
      child: Column(
        children: [
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: opt1,
                  autofocus: true,
                  obscureText: false,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: opt2,
                  focusNode: pin2FocusNode,
                  obscureText: false,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: opt3,
                  focusNode: pin3FocusNode,
                  obscureText: false,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: opt4,
                  focusNode: pin4FocusNode,
                  obscureText: false,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              var result = opt1.text.toString() +
                  opt2.text.toString() +
                  opt3.text.toString() +
                  opt4.text.toString();
              print('opt = $result');
              print('opt sqlite = ${user.otp}');
              if (result == user.otp) {
                Navigator.pushNamed(context, '/forgotpassword/step03');
              } else {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Xác nhận thất bạu"),
                          content: const Text("Vui lòng nhập lại mã OTP"),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ));
              }
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(400, 50))),
            child:
                Text('Tiếp', style: style(20, Colors.white, FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
