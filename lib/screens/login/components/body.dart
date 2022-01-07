import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/services/login_service.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  Profile requestModel = Profile(
      tokenUser: "",
      user: User(
          id: 0,
          email: "",
          password: "",
          name: "",
          phone: "",
          address: "",
          avatar: "",
          userType_id: 0,
          status: 0));
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    requestModel;
  }

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
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                //iconColor: Colors.red,
                hintText: 'Tên đăng nhập',
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
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: defaultPadding * 2),
            TextFormField(
              controller: passwordController,
              onSaved: (input) => requestModel.user!.password = input!,
              validator: (input) =>
                  (input)!.length < 3 ? "Mật khẩu nhiều hơn 3 kí tự" : null,
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.lock_outlined, color: Colors.black),
                hintText: 'Mật khẩu',
                hintStyle: style(20, Colors.grey, FontWeight.normal),
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
            ElevatedButton(
              onPressed: () {
                login(emailController.text, passwordController.text, context);
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(400, 50))),
              child: Text('Đăng nhập',
                  style: style(20, Colors.white, FontWeight.bold)),
            ),
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  child: Text(
                    'Đăng kí',
                    style:
                        style(18, const Color(0xFF8D99AE), FontWeight.normal),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
                TextButton(
                  child: Text(
                    'Quên mật khẩu?',
                    style:
                        style(18, const Color(0xFF8D99AE), FontWeight.normal),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgotpassword');
                  },
                ),
              ],
            ),
            const SizedBox(height: defaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(width: 130, height: 2, color: Colors.grey),
                Text(
                  'Hoặc',
                  style: style(18, primaryTextColor, FontWeight.normal),
                ),
                Container(width: 130, height: 2, color: Colors.grey)
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/logoFB.svg',
                      // width: 100,
                      height: 100,
                      // fit: BoxFit.cover,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/logoGG.svg',
                      // width: 200,
                      height: 200,
                      // fit: BoxFit.cover,
                    )),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
