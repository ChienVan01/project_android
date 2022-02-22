import 'package:intl/intl.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:provider/provider.dart';

UserProfile user = UserProfile(
  id: 0,
  email: "",
  password: "",
  name: "",
  phone: "",
  address: "",
  avatar: "",
  tokenUser: '',
  status: 0,
);

Future getUser() async {
  user = await DBConfig.instance.getUser();
}

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getUser();
    final cartP = Provider.of<CartProvider>(context);
    // cart = await cartP.getCheckout(user.id);
    return FutureBuilder(
        future: cartP.getData(user.id, 'checkout'),
        builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Text('cung sai ne');
            } else {
              return Column(
                  children:
                      snapshot.data!.map((e) => product(context, e)).toList());
            }
          }
          return const Text('sai ne');
        });
  }
}

Widget product(context, Cart cart) {
  return Container(
    height: 120,
    color: Colors.white,
    padding: const EdgeInsets.all(defaultPadding / 4),
    margin: const EdgeInsets.only(bottom: defaultPadding),
    child: Row(children: <Widget>[
      Image.network('http://10.0.2.2/upload/product/${cart.avatar}',
          width: 120),
      // SizedBox(width: 120, child: Text(widget.cart.avatar)),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cart.name,
              style: style(16, primaryTextColor, FontWeight.bold),
            ),
            Text(
              NumberFormat.decimalPattern().format(cart.price) + 'đ',
              style: style(16, primaryColor, FontWeight.bold),
            ),
            Text(
              NumberFormat.decimalPattern().format(cart.initialPrice * 1.1) +
                  'đ',
              style: const TextStyle(
                  fontSize: 15,
                  color: primaryTextColor,
                  decoration: TextDecoration.lineThrough),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Số lượng: '),
                Container(
                  padding: const EdgeInsets.all(0),
                  width: 40,
                  height: 23,
                  decoration: const BoxDecoration(
                      // border: Border.all(color: Colors.grey, width: 2),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      cart.quantity.toString(),
                      style: style(16, primaryTextColor, FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]),
  );
}
