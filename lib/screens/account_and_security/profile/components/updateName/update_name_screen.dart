import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/components/header.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/services/update_user_service.dart';

class UpdateNameScreen extends StatefulWidget {
  const UpdateNameScreen({Key? key}) : super(key: key);

  @override
  State<UpdateNameScreen> createState() => _UpdateNameScreenState();
}
DBConfig? dbConfig = DBConfig.instance;
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
                      print(user.password);
                      updateUser(controller.text.toString(), user.password, user.id, context);
                      dbConfig!.updateUser(UserProfile(
                        id: user.id, 
                        email: user.email, 
                        password: user.password, 
                        name: controller.text.toString(),
                        tokenUser: user.tokenUser, 
                        status: user.status,
                      )).then((value) {
                            print('sua thanh cong');
                          }).onError((error, stackTrace) {
                            print(error.toString());
                              print('sua that bai');
                          });
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
              ),
             const Padding(
                padding:  EdgeInsets.all(defaultPadding / 2),
                child: Text("dưới 100 kí tự"),
              )
            ]));
  }
}
