import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class BodyRegister extends StatefulWidget {
  BodyRegister({Key? key}) : super(key: key);

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  @override
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var repasswordController = TextEditingController();
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
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: defaultPadding),
            TextField(
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
                Navigator.pushNamed(context, '/login');
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
