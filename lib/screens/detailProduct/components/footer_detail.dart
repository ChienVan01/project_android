// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:project_android/screens/payment/payment_screen.dart';
import 'package:provider/provider.dart';

class FooterDetail extends StatefulWidget {
  const FooterDetail({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<FooterDetail> createState() => _FooterDetailState();
}

class _FooterDetailState extends State<FooterDetail> {
  UserProfile user = UserProfile(
      id: 0,
      email: '',
      password: '',
      name: '',
      phone: '',
      address: '',
      avatar: '',
      tokenUser: '',
      status: 0);
  @override
  void initState() {
    super.initState();

    refreshNote();
    cart;
    // getCart();
  }

  Future refreshNote() async {
    user = await DBConfig.instance.getUser();
  }

  List<Cart> cart = [];
  Future getCart() async {
    // getUser();
    final cartP = Provider.of<CartProvider>(context);
    cart = await cartP.getCheckout(user.id);
  }

  @override
  Widget build(BuildContext context) {
    DBConfig dbConfig = DBConfig.instance;
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
                print(widget.product.name);
                print(widget.product.origin);
                int quantity = 1;
                print('name' + user.name);
                if (user.name == '') {
                  Navigator.pushNamed(context, '/login');
                } else {
                  dbConfig
                      .insertCart(
                          Cart(
                              id: widget.product.id.toString() + '${user.id}',
                              productId: widget.product.id,
                              userId: user.id,
                              name: widget.product.name,
                              origin: widget.product.origin,
                              productTypeId: widget.product.productTypeId,
                              price: widget.product.price,
                              initialPrice: widget.product.price,
                              quantity: quantity,
                              avatar: widget.product.avatar,
                              status: 1),
                          'cart')
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
                }
              },
              icon: const Icon(Icons.shopping_cart_outlined),
              color: Colors.white),
        ),
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
            child: Center(
              child: InkWell(
                onTap: () async {
                  dbConfig.deleteAll();
                  dbConfig
                      .insertCart(
                          Cart(
                              id: widget.product.id.toString() + '${user.id}',
                              productId: widget.product.id,
                              userId: user.id,
                              name: widget.product.name,
                              origin: widget.product.origin,
                              productTypeId: widget.product.productTypeId,
                              price: widget.product.price,
                              initialPrice: widget.product.price,
                              quantity: 1,
                              avatar: widget.product.avatar,
                              status: 1),
                          'checkout')
                      .then((value) {
                    print('Them checkout thanh cong');
                  }).onError((error, stackTrace) {
                    print("error: " + error.toString());
                  });
                  getCart();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentScreen()));
                },
                child: const Text(
                  'Mua ngay',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/payment');
          },
        ),
      ],
    );
  }
}
