// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:project_android/screens/payment/payment_screen.dart';
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
List<Cart> cart = [];

Future getUser() async {
  user = await DBConfig.instance.getUser();
}

Future getCart(context) async {
  getUser();
  final cartP = Provider.of<CartProvider>(context);
  cart = await cartP.getData(user.id, 'checkout');
}

class FooterCart extends StatelessWidget {
  const FooterCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getCart(context);

    return Consumer<CartProvider>(
        builder: (context, value, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 63,
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  width: MediaQuery.of(context).size.width * 0.666,
                  color: Colors.white,
                  child: Row(children: <Widget>[
                    Text('Tổng tiền: ',
                        style: style(15, primaryTextColor, FontWeight.normal)),
                    Text(
                        NumberFormat.decimalPattern()
                                .format(value.getTotalPrice())
                                .toString() +
                            'đ',
                        style: style(20, primaryColor, FontWeight.bold))
                  ]),
                ),
                TextButton(
                  onPressed: () {
                    if (cart.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            Future.delayed(const Duration(milliseconds: 1300),
                                () {
                              Navigator.of(context).pop();
                            });
                            return const AlertDialog(
                              title: Text("Mua hàng không thành công"),
                              content: Text("Bạn chưa chọn sản phầm nào!"),
                              // actions: <Widget>[
                              //   // usually buttons at the bottom of the dialog
                              //   TextButton(
                              //     child: const Text("OK"),
                              //     onPressed: () {
                              //       Navigator.of(context).pop();
                              //     },
                              //   ),
                              // ],
                            );
                          });
                    } else {
                      print('checkout: ${cart[0].avatar}');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentScreen()));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(defaultPadding),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Mua hàng',
                    style: style(20, backgroundColor, FontWeight.bold),
                  ),
                ),
              ],
            ));
  }
}
