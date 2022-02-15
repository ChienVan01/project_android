import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/account_and_security/profile/components/changePassword/confirm/confirm_password_screen.dart';
import 'package:project_android/screens/account_and_security/profile/components/textfield_widget.dart';
import 'package:project_android/services/update_user_service.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  UserProfile user = UserProfile(
      id: 0,
      email: '',
      password: '',
      name: '',
      phone: '',
      address: '',
      avatar: '',
      tokenUser: '',
      status: 0);
  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    user = await DBConfig.instance.getUser();
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          child: Header(
              title: 'Thay đổi mật khẩu',
              backgroundColor: primaryColor,
              textColor: colorWhite,
              action: null),
          preferredSize: Size(double.infinity, 55),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "Mật khẩu mới",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: colorBorder),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    obscureText: true,
                    controller: repasswordController,
                    decoration: const InputDecoration(
                      hintText: "Xác Nhận Mật khẩu mới",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: colorBorder),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  if(passwordController.text.toString() == repasswordController.text.toString() && passwordController.text.toString() != user.password)
                  {
                    print(user.id);
                      print(user.password);
                      updateUser(user.name, passwordController.text.toString(), user.phone, user.id, context);
                      dbConfig!.updateUser(UserProfile(
                        id: user.id, 
                        email: user.email, 
                        password:passwordController.text.toString(),
                        name: user.name,
                        phone:user.phone,
                        tokenUser: user.tokenUser, 
                        status: user.status,
                      ))
                          .then((value) {
                        print('sua thanh cong');
                      }).onError((error, stackTrace) {
                        print(error.toString());
                        print('sua that bai');
                      });
                  }
                  else{
                     print('sai');
                  }
                },
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(const Size(400, 50))),
                child: Text('Xác nhận',
                    style: style(20, Colors.white, FontWeight.bold)),
              ),
            ]));
  }
}
