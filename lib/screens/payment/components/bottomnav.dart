import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:project_android/services/order_service.dart';
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

Future refreshNote() async {
  user = await DBConfig.instance.getUser();
}

List<Cart> listCart = [];
Future getCart() async {
  refreshNote();
  listCart = await DBConfig.instance.getCartList(user.id, 'checkout');
}

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getCart();
    List<Map<String, dynamic>> a = listCart
        .map((e) => {
              "id": e.productId,
              "Name": e.name,
              "ProductType_id": e.productTypeId,
              "Price": e.initialPrice,
              "Quantity": e.Quantity
            })
        .toList();
    final cartP = Provider.of<CartProvider>(context);
    final total = cartP.getTotalPrice();
    return Container(
      height: 111,
      color: Colors.white,
      child: Column(
        children: [
          const Divider(thickness: 2, height: 1),
          const PageRoute(
              text: 'Mã Giảm Giá',
              iconLeading: Icons.local_offer_outlined,
              iconTraling: Icons.navigate_next_outlined,
              press: '/choosevoucher'),
          const Divider(thickness: 2, height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Thành Tiền:  ",
                      ),
                      Consumer<CartProvider>(
                          builder: (context, value, child) => (Text(
                              NumberFormat.decimalPattern()
                                      .format(value.getTotalPrice())
                                      .toString() +
                                  'đ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontSize: 20,
                              ))))
                    ],
                  ),
                ],
              ),
              const Divider(thickness: 1, height: 1),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white38),
                  shadowColor: MaterialStateProperty.all(primaryColor),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                ),
                child: Container(
                  height: 52,
                  width: 130.5,
                  color: primaryColor,
                  child: const Center(
                    child: Text(
                      'Thanh Toán',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () {
                  orderService(
                    1,
                    3,
                    1,
                    1,
                    total,
                    a,
                    context,
                  );
                  DBConfig.instance.deleteAll();

                  // print(listCart[0].id);
                  listCart
                      .forEach((i) => DBConfig.instance.delete(i.id, 'cart'));
                  // print(listCart.map((e) => e.id));
                },
              )
            ],
          ),
        ],
      ),
    );
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
