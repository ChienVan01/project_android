import 'package:flutter/material.dart';
import 'package:project_android/DB/cart_db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:provider/provider.dart';

class FooterDetail extends StatelessWidget {
  const FooterDetail({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    DBConfig? dbConfig = DBConfig();
    final cart = Provider.of<CartProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white38),
            shadowColor: MaterialStateProperty.all(primaryColor),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          ),
          child: Container(
            height: 52,
            width: 130.5,
            color: primaryTextColor,
            child: const Icon(Icons.textsms, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/chat');
          },
        ),
        Container(
          height: 52,
          width: 130.5,
          color: primaryTextColor,
          child: IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/cart');
                print(product.name);
                print(product.origin);
                int quantity = 1;
                dbConfig
                    .insert(Cart(
                        id: product.id,
                        productId: product.id,
                        name: product.name,
                        origin: product.origin,
                        productTypeId: product.productTypeId,
                        price: product.price,
                        initialPrice: product.price,
                        quantity: quantity,
                        avatar: product.avatar,
                        status: 1))
                    .then((value) {
                  // cart.addTotalPrice(double.parse(product.price.toString()));
                  // cart.addCounter();
                  print('Them thanh cong');
                  const snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Thêm sản phẩm thành công'),
                    duration: Duration(seconds: 1),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }).onError((error, stackTrace) {
                  print("error: " + error.toString());
                  print('Quantity: $quantity');
                  // quantity++;
                  // dbConfig.updateQuantity(Cart(
                  //     id: product.id,
                  //     productId: product.id,
                  //     name: product.name,
                  //     origin: product.origin,
                  //     productTypeId: product.productTypeId,
                  //     price: product.price * (quantity + 1),
                  //     initialPrice: product.price,
                  //     quantity: quantity = quantity + 1,
                  //     avatar: product.avatar,
                  //     status: 1));
                  // cart.addTotalPrice(double.parse((product.price).toString()));
                  // cart.addCounter();
                  const snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Sản phẩm đã có trong giỏ hàng!'),
                      duration: Duration(seconds: 1));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              icon: const Icon(Icons.shopping_cart_outlined),
              color: Colors.white),
        ),
        // ElevatedButton(
        //     style: ButtonStyle(
        //       backgroundColor: MaterialStateProperty.all(Colors.white38),
        //       shadowColor: MaterialStateProperty.all(primaryColor),
        //       padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        //     ),
        //     child: Container(
        //       height: 52,
        //       width: 130.5,
        //       color: primaryTextColor,
        //       child: const Icon(Icons.shopping_cart_outlined,
        //           color: Colors.white),
        //     ),
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/choosevoucher');
        //     }),
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
                'Mua ngay',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
