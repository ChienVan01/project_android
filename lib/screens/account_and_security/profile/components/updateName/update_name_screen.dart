import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/account_and_security/profile/components/textfield_widget.dart';
import 'package:project_android/services/update_user_service.dart';

class UpdateNameScreen extends StatefulWidget {
  const UpdateNameScreen({Key? key}) : super(key: key);

  @override
  State<UpdateNameScreen> createState() => _UpdateNameScreenState();
}

class _UpdateNameScreenState extends State<UpdateNameScreen> {
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
        appBar: PreferredSize(
          child: Header(
              title: 'Sửa tên',
              backgroundColor: primaryColor,
              textColor: colorWhite,
              action: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      print(controller.text.toString());
                      print(user.id);
                      update(controller.text.toString(), user.id, context);

                    },
                    child: const Text("Lưu"),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                    ))
              ]),
          preferredSize: const Size(double.infinity, 55),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  obscureText: false,
                  decoration:const InputDecoration(
                    hintText: "Nhập vào đây",
                     enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: colorBorder),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                    )),
                  ),
            
                ),
              ),
              Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Text("dưới 100 kí tự"),
              )
            ]));
  }
}
