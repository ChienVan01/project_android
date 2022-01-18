// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/services/register_service.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({Key? key}) : super(key: key);

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var repasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding:
            const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/logo_full.png',
              width: 600, height: 150, fit: BoxFit.cover,
              // scale: 1,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Họ và tên',
                hintStyle: style(18, Colors.grey, FontWeight.normal),
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
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: defaultPadding),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email đăng nhập',
                hintStyle: style(18, Colors.grey, FontWeight.normal),
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
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: defaultPadding),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.phone_outlined, color: Colors.black),
                hintText: 'Số điện thoại',
                hintStyle: style(18, Colors.grey, FontWeight.normal),
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
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: defaultPadding),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.lock_outlined, color: Colors.black),
                hintText: 'Mật khẩu',
                hintStyle: style(18, Colors.grey, FontWeight.normal),
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
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: defaultPadding),
            TextField(
              controller: repasswordController,
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.lock_outlined, color: Colors.black),
                hintText: 'Nhập lại mật khẩu',
                hintStyle: style(18, Colors.grey, FontWeight.normal),
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
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: defaultPadding * 2),
            ElevatedButton(
              onPressed: () {
                register(
                    nameController.text,
                    phoneController.text,
                    emailController.text,
                    passwordController.text,
                    repasswordController.text,
                    context);
                print(nameController.text);
                print(phoneController.text);
                print(emailController.text);
                print(passwordController.text);
                print(repasswordController.text);
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(400, 50))),
              child: Text('Đăng kí',
                  style: style(20, Colors.white, FontWeight.bold)),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    ]);
  }
}
