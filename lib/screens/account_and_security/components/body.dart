import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account_and_security/components/button_footer.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: Container(
                color: Colors.white,
                child: Column(children: const <Widget>[
                  TilteItem(text: "Tài khoản của tôi"),
                  Item(
                      text: 'Hồ sơ của tôi',
                      press: '/account_and_security/profile'),
                  Divider(),
                  Item(
                      text: 'Thay đổi địa chỉ',
                      press: '/account_and_security/address'),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: Container(
                color: Colors.white,
                child: Column(children: const <Widget>[
                  TilteItem(text: "Hỗ Trợ"),
                  Item(
                      text: 'Trung tâm hỗ trợ',
                      press: '/account_and_security/support'),
                  Divider(),
                  Item(
                      text: 'Điều khoản ShopGear',
                      press: '/account_and_security/rules'),
                ])),
          ),
          footerButton(),
        ],
      ),
    ]);
  }
}

class TilteItem extends StatelessWidget {
  const TilteItem({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: primaryColor,
        fontSize: 20,
      ),
    ));
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text, press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(text),
        trailing: const Icon(
          Icons.navigate_next_outlined,
        ),
        onTap: () {
          Navigator.pushNamed(context, press);
        });
  }
}
