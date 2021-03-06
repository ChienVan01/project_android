import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_android/screens/payment/components/transport_unit.dart';
import 'package:project_android/screens/payment/components/list_product.dart';

class BodyPayment extends StatelessWidget {
  const BodyPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      GFListTile(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          avatar: const Icon(
            Icons.location_on,
            color: primaryColor,
          ),
          icon: const Icon(Icons.navigate_next_outlined),
          title: const Text("Trương Văn Chiến | 0358208351",
              style: TextStyle(
                  height: 2, fontWeight: FontWeight.bold, fontSize: 18)),
          subTitle: const Text("141 Tám Danh, Phường 4, Quận 8, TP Hồ Chí Minh",
              style: TextStyle(
                  height: 2, fontWeight: FontWeight.bold, fontSize: 14)),
          onTap: () {
            Navigator.pushNamed(context, '/address');
          }),
      const Divider(thickness: 2, height: 1),
      const ListProducts(),
      const Divider(thickness: 2, height: 1),
      const TransportUnit(),
      const Divider(thickness: 2, height: 1),
      const PageRoute(
          text: 'Phương Thức Thanh Toán',
          iconLeading: Icons.credit_card,
          iconTraling: Icons.navigate_next_outlined,
          press: '/choosepayment'),
    ]);
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
        selected: true,
        selectedTileColor: Colors.white,
        leading: Icon(iconLeading, color: primaryColor),
        title: Text(text),
        trailing: Icon(iconTraling, color: primaryColor),
        onTap: () {
          Navigator.pushNamed(context, press);
        });
  }
}
