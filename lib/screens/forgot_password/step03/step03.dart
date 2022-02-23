// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/services/update_user_service.dart';

class ForgotPassStep3 extends StatefulWidget {
  const ForgotPassStep3({Key? key}) : super(key: key);

  @override
  State<ForgotPassStep3> createState() => _ForgotPassStep3State();
}

class _ForgotPassStep3State extends State<ForgotPassStep3> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  bool _isObscure = true;
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
    refreshNote();
  }

  Future refreshNote() async {
    user = await DBConfig.instance.getUserOPT();
  }

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
              controller: passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'Mật khẩu mới',
                hintStyle: style(20, Colors.grey, FontWeight.normal),
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),
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
            TextField(
              controller: repasswordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'Nhập lại mật khẩu mới',
                hintStyle: style(20, Colors.grey, FontWeight.normal),
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: primaryColor),
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),
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
                print(passwordController.text.toString());
                print(repasswordController.text.toString());
                print('user id = ${user.id}');
                if (passwordController.text.isNotEmpty &&
                    repasswordController.text.isNotEmpty &&
                    passwordController.text.toString() ==
                        repasswordController.text.toString()) {
                  updateUser(
                      user.name,
                      user.email,
                      user.address,
                      passwordController.text.toString(),
                      user.phone,
                      user.id,
                      context);
                  DBConfig.instance.deleteOpt();
                } else {
                  print('mat khau khong trung khop');
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("Mật khẩu không trùng khớp"),
                            content: const Text("Vui lòng nhập lại mật khẩu"),
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
              child: Text('Xác nhận',
                  style: style(20, Colors.white, FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
