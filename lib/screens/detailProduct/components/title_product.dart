// ignore_for_file: unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/favorite/components/favorite_provider.dart';
import 'package:provider/provider.dart';

UserProfile user = UserProfile as UserProfile;
Future refreshNote() async {
  user = await DBConfig.instance.getUser();
}

class TitleProduct extends StatelessWidget {
  const TitleProduct({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    DBConfig dbConfig = DBConfig.instance;
    // final wishList = Provider.of<FavoriteProvider>(context);
    // final wish = wishList.getDataProduct(2, product.id);
    // final wish = dbConfig.getProduct(2, 'wishlist', product.id);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: defaultPadding / 2),
          padding: const EdgeInsets.all(defaultPadding),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text(
                product.name,
                style: const TextStyle(fontSize: 22, color: primaryTextColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(right: defaultPadding / 4),
                        child: Text('Thương hiệu'),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: defaultPadding / 4),
                        child: Text(
                          product.origin,
                          style: const TextStyle(color: primaryColor),
                        ),
                      ),
                      // Text(
                      //   '| SKU: 200700392',
                      //   style: TextStyle(color: Color(0xFF8D99AE)),
                      // )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(right: defaultPadding / 4),
                        child: Text(
                          NumberFormat.decimalPattern()
                              .format(product.price)
                              .toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      Text(
                        NumberFormat.decimalPattern()
                            .format(product.price)
                            .toString(),
                        style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(right: defaultPadding / 2),
                        child: SvgPicture.asset(
                          'assets/svg/share.svg',
                          color: Colors.black,
                          fit: BoxFit.contain,
                          width: 25,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            dbConfig
                                .insertCart(
                                    Cart(
                                        id: product.id.toString(),
                                        productId: product.id,
                                        userId: user.id,
                                        name: product.name,
                                        origin: product.origin,
                                        productTypeId: product.productTypeId,
                                        price: product.price,
                                        initialPrice: product.price,
                                        quantity: 1,
                                        avatar: product.avatar,
                                        status: 1),
                                    'wishlist')
                                .then((value) {
                              // cart.addTotalPrice(double.parse(product.price.toString()));
                              // cart.addCounter();
                              print('Them thanh cong');
                              // const snackBar = SnackBar(
                              //   backgroundColor: Colors.green,
                              //   content: Text('Thêm sản phẩm thành công'),
                              //   duration: Duration(seconds: 1),
                              // );

                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(snackBar);
                            }).onError((error, stackTrace) {
                              dbConfig.deleteWish(product.id, 'wishlist');
                              // const snackBar = SnackBar(
                              //     backgroundColor: Colors.red,
                              //     content:
                              //         Text('Sản phẩm đã có trong giỏ hàng!'),
                              //     duration: Duration(seconds: 1));

                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(snackBar);
                            });
                          },
                          child: const Icon(Icons.favorite_border_outlined,
                              color: Colors.red)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: defaultPadding / 2),
          padding: const EdgeInsets.all(defaultPadding / 2),
          color: Colors.white,
          child: Column(
            children: [
              const Text('Chọn thêm 1 trong những khuyến mãi sau',
                  style: TextStyle(fontSize: 18)),
              Container(
                margin: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(
                      color: primaryColor, // Set border color
                      width: 1.0),
                ),
                child: boxDiscount(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget boxDiscount() {
  return const ListTile(
    leading: Icon(Icons.redeem, color: primaryColor),
    title: Text('Giảm giá clearance Giảm trực tiếp 5.500.000đ'),
    trailing: Icon(Icons.check, color: primaryColor),
  );
}
