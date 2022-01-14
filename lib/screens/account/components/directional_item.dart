import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/account/components/user_provider.dart';
import 'package:project_android/screens/cart/components/footer.dart';
import 'package:project_android/services/logout_service.dart';
import 'package:provider/provider.dart';

class DirectionalItem extends StatefulWidget {
  const DirectionalItem({Key? key}) : super(key: key);

  @override
  State<DirectionalItem> createState() => _DirectionalItemState();
}

class _DirectionalItemState extends State<DirectionalItem> {
  // UserProfile user = UserProfile(
  //     id: 0,
  //     email: '',
  //     password: '',
  //     name: '',
  //     phone: '',
  //     address: '',
  //     avatar: '',
  //     tokenUser: '',
  //     status: 0);
  // @override
  void initState() {
    super.initState();

    // refreshNote();
  }

  late UserProfile user;
  // bool check = false;

  // Future refreshNote() async {
  //   user = await DBConfig.instance.getUser();
  // }

  @override
  Widget build(BuildContext context) {
    // refreshNote();
    final user = Provider.of<UserProvider>(context);
    return FutureBuilder(
        future: user.getData(),
        builder: (context, AsyncSnapshot<UserProfile> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.id == null) {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: const <Widget>[
                        Divider(
                            thickness: defaultPadding / 2,
                            height: defaultPadding / 2,
                            color: backgroundColor),
                        PageRoute(
                            text: 'Đơn Hàng',
                            iconLeading: Icons.receipt_long_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/order'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Đã Thích',
                            iconLeading: Icons.favorite_border_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/favorite'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Mã Giảm Giá',
                            iconLeading: Icons.receipt_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account/components/order')
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: const <Widget>[
                        Divider(
                            thickness: defaultPadding / 2,
                            height: defaultPadding / 2,
                            color: backgroundColor),
                        PageRoute(
                            text: 'Đã Xem Gần Đây',
                            iconLeading: Icons.schedule_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account/components/order'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Đánh Giá Của Tôi',
                            iconLeading: Icons.star_border_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account/components/order'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: const <Widget>[
                        Divider(
                            thickness: defaultPadding / 2,
                            height: defaultPadding / 2,
                            color: backgroundColor),
                        PageRoute(
                            text: 'Tài Khoản Và Bảo Mật',
                            iconLeading: Icons.lock_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account_and_security'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Trung Tâm Hỗ Trợ',
                            iconLeading: Icons.help_outline_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account_and_security/support'),
                      ],
                    ),
                  ),
                  
                ],
              );
            } else {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: const <Widget>[
                        Divider(
                            thickness: defaultPadding / 2,
                            height: defaultPadding / 2,
                            color: backgroundColor),
                        PageRoute(
                            text: 'Đơn Hàng',
                            iconLeading: Icons.receipt_long_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/order'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Đã Thích',
                            iconLeading: Icons.favorite_border_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/favorite'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Mã Giảm Giá',
                            iconLeading: Icons.receipt_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account/components/order')
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: const <Widget>[
                        Divider(
                            thickness: defaultPadding / 2,
                            height: defaultPadding / 2,
                            color: backgroundColor),
                        PageRoute(
                            text: 'Đã Xem Gần Đây',
                            iconLeading: Icons.schedule_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account/components/order'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Đánh Giá Của Tôi',
                            iconLeading: Icons.star_border_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account/components/order'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: const <Widget>[
                        Divider(
                            thickness: defaultPadding / 2,
                            height: defaultPadding / 2,
                            color: backgroundColor),
                        PageRoute(
                            text: 'Tài Khoản Và Bảo Mật',
                            iconLeading: Icons.lock_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account_and_security'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Trung Tâm Hỗ Trợ',
                            iconLeading: Icons.help_outline_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account_and_security/support'),
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        // print('token: ${user.tokenUser}');
                        // print('name: ${user.name}');
                        logoutService(snapshot.data!.tokenUser.toString(),
                            snapshot.data!.id, context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: defaultPadding / 2),
                        width: 350,
                        height: 50,
                        decoration: const BoxDecoration(color: primaryColor),
                        child: const Center(
                          child: Text('Đăng xuất',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ))
                ],
              );
            }
          }
          return Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: const <Widget>[
                    Divider(
                        thickness: defaultPadding / 2,
                        height: defaultPadding / 2,
                        color: backgroundColor),
                    PageRoute(
                        text: 'Đơn Hàng',
                        iconLeading: Icons.receipt_long_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/order'),
                    Divider(thickness: 1, height: 1),
                    PageRoute(
                        text: 'Đã Thích',
                        iconLeading: Icons.favorite_border_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/favorite'),
                    Divider(thickness: 1, height: 1),
                    PageRoute(
                        text: 'Mã Giảm Giá',
                        iconLeading: Icons.receipt_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/account/components/order')
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: const <Widget>[
                    Divider(
                        thickness: defaultPadding / 2,
                        height: defaultPadding / 2,
                        color: backgroundColor),
                    PageRoute(
                        text: 'Đã Xem Gần Đây',
                        iconLeading: Icons.schedule_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/account/components/order'),
                    Divider(thickness: 1, height: 1),
                    PageRoute(
                        text: 'Đánh Giá Của Tôi',
                        iconLeading: Icons.star_border_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/account/components/order'),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: const <Widget>[
                    Divider(
                        thickness: defaultPadding / 2,
                        height: defaultPadding / 2,
                        color: backgroundColor),
                    PageRoute(
                        text: 'Tài Khoản Và Bảo Mật',
                        iconLeading: Icons.lock_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/account_and_security'),
                    Divider(thickness: 1, height: 1),
                    PageRoute(
                        text: 'Trung Tâm Hỗ Trợ',
                        iconLeading: Icons.help_outline_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/account_and_security/support'),
                  ],
                ),
              ),
            ],
          );
        });
  }
}


class PageRoute extends StatelessWidget {
  const PageRoute({
    Key? key,
    required this.text,
    required this.iconLeading,
    required this.iconTraling,
    required this.press,
  }) : super(key: key);

  final String text, press;
  final IconData iconLeading, iconTraling;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          iconLeading,
        ),
        title: Text(text),
        trailing: Icon(iconTraling),
        onTap: () {
          Navigator.pushNamed(context, press);
        });
  }
}
