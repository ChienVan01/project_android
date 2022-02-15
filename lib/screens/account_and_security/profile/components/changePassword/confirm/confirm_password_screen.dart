import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/model/user.dart';
class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}
DBConfig? dbConfig = DBConfig.instance;
class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
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

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:const PreferredSize(
          child:  Header(
              title: 'Xác nhận mật khẩu',
              backgroundColor: primaryColor,
              textColor: colorWhite,
              action:null),
          preferredSize:  Size(double.infinity, 55),
        ),
        body: Container(

           padding: const EdgeInsets.only(
            top: defaultPadding,
            left: defaultPadding,
            right: defaultPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: controller,
                  obscureText: true,
                  decoration:const InputDecoration(
                    hintText: "Nhập mật khẩu hiện tại",
                     enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: colorBorder),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                  ),
              
                ),
                const SizedBox(height: defaultPadding),
              ElevatedButton(
                onPressed: () {
                  print(controller.text.toString());
                  print(user.password);
                  if(controller.text.toString()==user.password)
                  {
                    print('pass trung khop');
                  }
                  else{
                    print('sai pass');
                  }
                },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(400, 50))),
                child:
                    Text('Tiếp', style: style(20, Colors.white, FontWeight.bold)),
              ),
              ]),
        ));
  }
}
