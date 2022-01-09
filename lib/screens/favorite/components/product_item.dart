// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/favorite/components/favorite_provider.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.image,
      required this.price})
      : super(key: key);
  final int price;
  final String id, title, image;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  DBConfig dbConfig = DBConfig.instance;

  @override
  Widget build(BuildContext context) {
    // final wishList = Provider.of<FavoriteProvider>(context);
    return Container(
      width: 180.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: colorWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/images/product/${widget.image}',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding / 2),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(children: <Widget>[
                Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(
                    NumberFormat.decimalPattern().format(widget.price),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: primaryColor),
                  ),
                  Text(
                    NumberFormat.decimalPattern()
                        .format(widget.price * 1.3.toInt()),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 13,
                        decoration: TextDecoration.lineThrough),
                  ),
                ]),
                InkWell(
                  onTap: () {
                    dbConfig.deleteWish(widget.id, 'wishlist');
                  },
                  child: const Icon(
                    Icons.favorite_outlined,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
