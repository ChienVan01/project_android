// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/DB/cart_db_config.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
// ignore: unnecessary_import
import 'package:provider/provider.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({Key? key, required this.cart}) : super(key: key);
  final Cart cart;

  @override
  _ProductCartState createState() => _ProductCartState();
}

DBConfig? dbConfig = DBConfig();

class _ProductCartState extends State<ProductCart> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(defaultPadding / 4),
      margin: const EdgeInsets.only(top: defaultPadding),
      child: Row(children: <Widget>[
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(Colors.grey),
            value: isChecked,
            splashRadius: 40,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });

              cartProvider.checked(value, widget.cart.price.toDouble());
            },
            //  (bool? value) => {
            //   (bool? value) {
            //     setState(() {
            //       isChecked = value!;
            //     });
            //   },
            // },
          ),
        ),
        Image.asset('assets/images/product/${widget.cart.avatar}', width: 120),
        // SizedBox(width: 120, child: Text(widget.cart.avatar)),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.cart.name,
                style: style(16, primaryTextColor, FontWeight.bold),
              ),
              Text(
                NumberFormat.decimalPattern().format(widget.cart.price) + 'đ',
                style: style(16, primaryColor, FontWeight.bold),
              ),
              Text(
                NumberFormat.decimalPattern()
                        .format(widget.cart.initialPrice * 1.1) +
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
                  if (widget.cart.quantity == 1)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: defaultPadding, right: defaultPadding),
                      child: Text(
                        '-',
                        style: style(18, Colors.grey.shade300, FontWeight.bold),
                      ),
                    )
                  else
                    ElevatedButton(
                      onPressed: () {
                        int quantity = widget.cart.quantity;
                        int price = widget.cart.initialPrice;
                        quantity--;
                        int? newPrice = price * quantity;
                        if (quantity > 0) {
                          dbConfig!
                              .updateQuantity(Cart(
                                  id: widget.cart.id,
                                  productId: widget.cart.id,
                                  name: widget.cart.name,
                                  origin: widget.cart.origin,
                                  productTypeId: widget.cart.productTypeId,
                                  price: newPrice,
                                  initialPrice: widget.cart.initialPrice,
                                  quantity: quantity,
                                  avatar: widget.cart.avatar,
                                  status: 1))
                              .then((value) {
                            newPrice = 0;
                            quantity = 0;
                            cartProvider.removeTotalPrice(double.parse(
                                widget.cart.initialPrice.toString()));
                          }).onError((error, stackTrace) {
                            print(error.toString());
                          });
                        }
                      },
                      child: Text(
                        '-',
                        style: style(18, primaryTextColor, FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(0),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(0),
                        minimumSize:
                            MaterialStateProperty.all(const Size(30, 15)),
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    width: 40,
                    height: 23,
                    decoration: const BoxDecoration(
                        // border: Border.all(color: Colors.grey, width: 2),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        (widget.cart.quantity).toString(),
                        style: style(16, primaryTextColor, FontWeight.bold),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int quantity = widget.cart.quantity;
                      int price = widget.cart.initialPrice;
                      quantity++;
                      int? newPrice = price * quantity;

                      dbConfig!
                          .updateQuantity(Cart(
                              id: widget.cart.id,
                              productId: widget.cart.id,
                              name: widget.cart.name,
                              origin: widget.cart.origin,
                              productTypeId: widget.cart.productTypeId,
                              price: newPrice,
                              initialPrice: widget.cart.initialPrice,
                              quantity: quantity,
                              avatar: widget.cart.avatar,
                              status: 1))
                          .then((value) {
                        newPrice = 0;
                        quantity = 0;
                        cartProvider.addTotalPrice(double.parse(
                            (widget.cart.initialPrice).toString()));
                      }).onError((error, stackTrace) {
                        print(error.toString());
                      });
                    },
                    child: Text(
                      '+',
                      style: style(18, primaryTextColor, FontWeight.normal),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(0),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      minimumSize:
                          MaterialStateProperty.all(const Size(30, 15)),
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
}
          
//   Container cartItem() {
//     return Container(
//         color: Colors.white,
//         padding: const EdgeInsets.all(defaultPadding / 2),
//         margin: const EdgeInsets.only(top: defaultPadding),
//         child: Row(
//           children: <Widget>[
//             Container(
//               width: 15,
//               height: 15,
//               decoration: BoxDecoration(
//                 color: backgroundColor,
//                 border: Border.all(color: Colors.black),
//               ),
//             ),
//             Image.asset('assets/images/product/product01.jpg', width: 120),
//             Flexible(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Laptop Dell Alienware M15 R6 (P109F001ABL) ',
//                     style: style(16, primaryTextColor, FontWeight.bold),
//                   ),
//                   Text(
//                     'SKU: 1810470',
//                     style: style(14, Colors.black45, FontWeight.normal),
//                   ),
//                   Text(
//                     '1.089.000đ',
//                     style: style(16, primaryColor, FontWeight.bold),
//                   ),
//                   const Text(
//                     '1.799.000đ',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: primaryTextColor,
//                         decoration: TextDecoration.lineThrough),
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         if (quantity == 1)
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: defaultPadding, right: defaultPadding),
//                             child: Text(
//                               '-',
//                               style: style(
//                                   18, Colors.grey.shade300, FontWeight.bold),
//                             ),
//                           )
//                         else
//                           ElevatedButton(
//                             onPressed: Down,
//                             child: Text(
//                               '-',
//                               style:
//                                   style(18, primaryTextColor, FontWeight.bold),
//                             ),
//                             style: ButtonStyle(
//                               padding: MaterialStateProperty.all(
//                                 const EdgeInsets.all(0),
//                               ),
//                               backgroundColor:
//                                   MaterialStateProperty.all(Colors.white),
//                               elevation: MaterialStateProperty.all(0),
//                               minimumSize:
//                                   MaterialStateProperty.all(const Size(30, 15)),
//                             ),
//                           ),
//                         Container(
//                           padding: const EdgeInsets.all(0),
//                           width: 40,
//                           height: 23,
//                           decoration: const BoxDecoration(
//                               // border: Border.all(color: Colors.grey, width: 2),
//                               color: Colors.white),
//                           child: Center(
//                             child: Text(
//                               '$quantity',
//                               style:
//                                   style(16, primaryTextColor, FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: Up,
//                           child: Text(
//                             '+',
//                             style:
//                                 style(18, primaryTextColor, FontWeight.normal),
//                           ),
//                           style: ButtonStyle(
//                             padding: MaterialStateProperty.all(
//                               const EdgeInsets.all(0),
//                             ),
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.white),
//                             elevation: MaterialStateProperty.all(0),
//                             minimumSize:
//                                 MaterialStateProperty.all(const Size(30, 15)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }
