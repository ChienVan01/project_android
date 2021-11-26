import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      style: style(16, primaryTextColor, FontWeight.bold))
                ]),
              )),
        ),
        SizedBox(
            height: 20,
            child: Container(
                color: const Color(0xff8E0019),
                child: Center(
                    child: Text("Nhấn để thay đổi",
                        style: style(16, colorWhite, FontWeight.normal))))),
        const Item(leading: "Tên", title: "Trương Văn Chiến",press:'/account_and_security/profile/components/updateName'),
        const Divider(height: 1),
        const SizedBox(
          height: 20,
        ),
        const Item(leading: "Ngày sinh", title: "Thiết lập ngay",press:'/account_and_security/profile/components/updateName'),
        const Divider(height: 1),
        const Item(leading: "Điện thoại", title: "*******419",press:'/account_and_security/profile/components/updateName'),
        const Divider(height: 1),
        const Item(leading: "Email", title: "Tr**********@gmail.com",press:'/account_and_security/profile/components/updateName'),
        const Divider(height: 1),
        const SizedBox(
          height: 20,
        ),
        const Item(leading: "Thay đổi mật khẩu", title: "",press:'/account_and_security/profile/components/changePassword/comfirm'),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.leading,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String leading, title,press;
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
                trailing: const Icon(
                  Icons.navigate_next_outlined,
                  color: primaryColor,
                ),
                onTap:   () {Navigator.pushNamed(context,press);},
                )));
  }
}
