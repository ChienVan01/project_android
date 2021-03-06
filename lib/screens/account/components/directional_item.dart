// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/account/components/user_provider.dart';
import 'package:project_android/screens/order/order_screen.dart';
import 'package:project_android/screens/rating/rating_screen.dart';
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
  @override
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
                            text: '????n H??ng',
                            iconLeading: Icons.receipt_long_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/order'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: '???? Th??ch',
                            iconLeading: Icons.favorite_border_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/favorite'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'M?? Gi???m Gi??',
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
                            text: '???? Xem G???n ????y',
                            iconLeading: Icons.schedule_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account/components/order'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: '????nh Gi?? C???a T??i',
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
                            text: 'T??i Kho???n V?? B???o M???t',
                            iconLeading: Icons.lock_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account_and_security'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Trung T??m H??? Tr???',
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
                      children: <Widget>[
                        const Divider(
                            thickness: defaultPadding / 2,
                            height: defaultPadding / 2,
                            color: backgroundColor),
                        ListTile(
                            leading: const Icon(
                              Icons.receipt_long_outlined,
                            ),
                            title: const Text('????n H??ng'),
                            trailing: const Icon(Icons.navigate_next_outlined),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrderScreen(
                                          userId:
                                              snapshot.data!.id.toString())));
                            }),
                        // PageRoute(
                        //     text: '????n H??ng',
                        //     iconLeading: Icons.receipt_long_outlined,
                        //     iconTraling: Icons.navigate_next_outlined,
                        //     press: '/order'),
                        const Divider(thickness: 1, height: 1),
                        const PageRoute(
                            text: '???? Th??ch',
                            iconLeading: Icons.favorite_border_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/favorite'),
                        const Divider(thickness: 1, height: 1),
                        const PageRoute(
                            text: 'M?? Gi???m Gi??',
                            iconLeading: Icons.receipt_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account/components/order')
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        const Divider(
                            thickness: defaultPadding / 2,
                            height: defaultPadding / 2,
                            color: backgroundColor),
                        const PageRoute(
                            text: '???? Xem G???n ????y',
                            iconLeading: Icons.schedule_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account/components/order'),
                        const Divider(thickness: 1, height: 1),
                        ListTile(
                            leading: const Icon(
                              Icons.star_border_outlined,
                            ),
                            title: const Text('????nh Gi?? C???a T??i'),
                            trailing: const Icon(Icons.navigate_next_outlined),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RatingScreen(id: snapshot.data!.id)));
                            }),
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
                            text: 'T??i Kho???n V?? B???o M???t',
                            iconLeading: Icons.lock_outlined,
                            iconTraling: Icons.navigate_next_outlined,
                            press: '/account_and_security'),
                        Divider(thickness: 1, height: 1),
                        PageRoute(
                            text: 'Trung T??m H??? Tr???',
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
                          child: Text('????ng xu???t',
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
                        text: '????n H??ng',
                        iconLeading: Icons.receipt_long_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/order'),
                    Divider(thickness: 1, height: 1),
                    PageRoute(
                        text: '???? Th??ch',
                        iconLeading: Icons.favorite_border_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/favorite'),
                    Divider(thickness: 1, height: 1),
                    PageRoute(
                        text: 'M?? Gi???m Gi??',
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
                        text: '???? Xem G???n ????y',
                        iconLeading: Icons.schedule_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/account/components/order'),
                    Divider(thickness: 1, height: 1),
                    PageRoute(
                        text: '????nh Gi?? C???a T??i',
                        iconLeading: Icons.star_border_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/rating'),
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
                        text: 'T??i Kho???n V?? B???o M???t',
                        iconLeading: Icons.lock_outlined,
                        iconTraling: Icons.navigate_next_outlined,
                        press: '/account_and_security'),
                    Divider(thickness: 1, height: 1),
                    PageRoute(
                        text: 'Trung T??m H??? Tr???',
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
  const PageRoute(
      {Key? key,
      required this.text,
      required this.iconLeading,
      required this.iconTraling,
      required this.press,
      this.userId})
      : super(key: key);

  final String text, press;
  final IconData iconLeading, iconTraling;
  final int? userId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          iconLeading,
        ),
        title: Text(text),
        trailing: Icon(iconTraling),
        onTap: () {
          Navigator.pushNamed(context, press, arguments: userId);
        });
  }
}
