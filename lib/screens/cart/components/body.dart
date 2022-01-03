// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:project_android/screens/cart/components/product_cart.dart';
import 'package:provider/provider.dart';

class BodyCart extends StatefulWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  State<BodyCart> createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  DBConfig? dbHelper = DBConfig();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return FutureBuilder(
        future: cart.getData(2),
        builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Giỏ hàng trống 🌵',
                        style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(snapshot.data![index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          dbHelper!.delete(snapshot.data![index].id, 'cart');
                          cart.removerCounter();
                          // cart.removeTotalPrice(double.parse(
                          //     snapshot.data![index].price.toString()));
                          if (cart.check == true) {
                            cart.checked(
                                false, snapshot.data![index].price.toDouble());
                          }
                          snapshot.data!.removeAt(index);
                        });
                      },
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(top: defaultPadding),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: const [
                            Spacer(),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                      child: ProductCart(
                        cart: snapshot.data![index],
                      ),
                    );
                  });
            }
          }
          return const Center(
              child: Text('Giỏ hàng trống', style: TextStyle(fontSize: 20)));
        });
  }
}
