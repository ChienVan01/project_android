import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:provider/provider.dart';

class FooterCart extends StatelessWidget {
  const FooterCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => Navigator.pushNamed(context, '/'),
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
