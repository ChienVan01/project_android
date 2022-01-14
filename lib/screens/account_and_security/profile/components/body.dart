import 'package:flutter/material.dart';

import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/account/components/user_provider.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return FutureBuilder(
        future: user.getData(),
        builder: (context, AsyncSnapshot<UserProfile> snapshot) {
          if (snapshot.hasData) {
            // ignore: unnecessary_null_comparison
            if (snapshot.data!.name != '') {
              return ListView(
                children: [
                  SizedBox(
                    width: 400,
                    height: 150,
                    child: Container(
                        color: colorWhite,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            const Icon(
                              Icons.image_outlined,
                              size: 70,
                            ),
                            Text("Ảnh đại diện",
                                style: style(
                                    16, primaryTextColor, FontWeight.bold))
                          ]),
                        )),
                  ),
                  SizedBox(
                      height: 20,
                      child: Container(
                          color: const Color(0xff8E0019),
                          child: Center(
                              child: Text("Nhấn để thay đổi",
                                  style: style(
                                      16, colorWhite, FontWeight.normal))))),
                  Item(
                    leading: "Tên",
                    title: snapshot.data!.name,
                    press:
                        '/account_and_security/profile/components/updateName',
                    trailing: const Icon(
                      Icons.navigate_next_outlined,
                      color: primaryColor,
                    ),
                  ),
                  const Divider(height: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  
                   Item(
                      leading: "Điện thoại",
                      title: snapshot.data!.phone.toString(),
                      press:
                          '/account_and_security/profile/components/updateName',
                      trailing: const Text("")),
                  const Divider(height: 1),
                  Item(
                      leading: "Email",
                      title: snapshot.data!.email,
                      press:
                          '/account_and_security/profile/components/updateName',
                      trailing: const Text("")),
                  const Divider(height: 1),
                  const SizedBox(
                    height: 20,
                  ),
                  const Item(
                    leading: "Thay đổi mật khẩu",
                    title: "",
                    press:
                        '/account_and_security/profile/components/changePassword/comfirm',
                    trailing: Icon(
                      Icons.navigate_next_outlined,
                      color: primaryColor,
                    ),
                  ),
                ],
              );
            }
          }
          return Container();
        });
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.leading,
    required this.title,
    required this.press,
    required this.trailing,
  }) : super(key: key);
  final String leading, title, press;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Container(
            color: colorWhite,
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  leading,
                  style: style(16, primaryTextColor, FontWeight.normal),
                ),
              ),
              title: Text(
                title,
                style: style(16, primaryTextColor, FontWeight.normal),
                textAlign: TextAlign.end,
              ),
              trailing: trailing,
              onTap: () {
                Navigator.pushNamed(context, press);
              },
            )));
  }
}
