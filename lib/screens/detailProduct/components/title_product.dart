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
import 'package:readmore/readmore.dart';

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
Future refreshNote() async {
  user = await DBConfig.instance.getUser();
}

// List<Cart> cart = [];
Cart cart = Cart(
  id: '',
  productId: 0,
  userId: 0,
  name: '',
  origin: '',
  productTypeId: 0,
  price: 0,
  initialPrice: 0,
  quantity: 0,
  avatar: '',
  status: 0,
);

class TitleProduct extends StatefulWidget {
  const TitleProduct({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<TitleProduct> createState() => _TitleProductState();
}

class _TitleProductState extends State<TitleProduct> {
  bool reBuild = false;
  @override
  void initState() {
    super.initState();
    reBuild;
  }

  @override
  Widget build(BuildContext context) {
    DBConfig dbConfig = DBConfig.instance;
    refreshNote();

    // final wishList = Provider.of<FavoriteProvider>(context);
    // final wish = wishList.getDataProduct(2, product.id);
    // final wish = dbConfig.getProduct(2, 'wishlist', product.id);
    String idCart = widget.product.id.toString() + user.id.toString();
    // Future getCart() async {
    //   refreshNote();
    //   final wish = Provider.of<FavoriteProvider>(context);
    //   cart = await wish.getDataProduct(idCart);
    // }

    final wish = Provider.of<FavoriteProvider>(context);
    // getCart();
    // print(idCart);
    // print('cart${cart.id}');
    // bool check = false;
    // if (cart.id == idCart) {
    //   check = true;
    // }

    // print(check);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: defaultPadding / 2),
          padding: const EdgeInsets.all(defaultPadding),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text(
                widget.product.name,
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
                          widget.product.origin,
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
                              .format(widget.product.price)
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
                            .format(widget.product.price)
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
                                      id: widget.product.id.toString() +
                                          user.id.toString(),
                                      productId: widget.product.id,
                                      userId: user.id,
                                      name: widget.product.name,
                                      origin: widget.product.origin,
                                      productTypeId:
                                          widget.product.productTypeId,
                                      price: widget.product.price,
                                      initialPrice: widget.product.price,
                                      quantity: 1,
                                      avatar: widget.product.avatar,
                                      status: 1),
                                  'wishlist')
                              .then((value) {
                            print('Them thanh cong');
                            setState(() {
                              !reBuild;
                            });
                          }).onError((error, stackTrace) {
                            print('Xoa thanh cong');
                            setState(() {
                              !reBuild;
                            });
                            dbConfig.deleteWish(
                                widget.product.id.toString() +
                                    user.id.toString(),
                                'wishlist');
                          });
                        },
                        child: FutureBuilder(
                            future: wish.getDataProduct(idCart),
                            builder: (context, AsyncSnapshot<Cart> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.id !=
                                    widget.product.id.toString() +
                                        user.id.toString()) {
                                  return const Icon(
                                      Icons.favorite_border_outlined);
                                } else {
                                  return const Icon(Icons.favorite,
                                      color: Colors.red);
                                }
                              }
                              return const Icon(Icons.favorite_border_outlined);
                            }),
                      )
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
        Container(
          margin: const EdgeInsets.only(top: defaultPadding / 2),
          padding: const EdgeInsets.all(defaultPadding / 2),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Mô tả",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 10),
              ReadMoreText(widget.product.info,
                  trimLines: 4,
                  trimLength: 10000,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Xem thêm',
                  trimExpandedText: 'Thu gọn',
                  style: const TextStyle(fontSize: 15)),
              // Text(widget.product.info, style: TextStyle(fontSize: 15)),
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
