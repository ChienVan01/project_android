import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/product.dart';

class TitleProduct extends StatelessWidget {
  const TitleProduct({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
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
                      const Icon(
                        Icons.favorite_border,
                      ),
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
