import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_android/constants.dart';

class TitleProduct extends StatelessWidget {
  const TitleProduct({Key? key}) : super(key: key);

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
              const Text(
                'Laptop Dell Alienware M15 R6 (P109F001ABL) P109F001 ( 15.6" Quad HD (2K)/ 240Hz/Intel Core i7-11800H/32GB/1TB SSD/NVIDIA GeForce RTX 3060/Windows 10 Home 64-bit/2.7kg)',
                style: TextStyle(fontSize: 22, color: primaryTextColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: defaultPadding / 4),
                        child: Text('Thương hiệu'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: defaultPadding / 4),
                        child: Text(
                          'DELL',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                      Text(
                        '| SKU: 200700392',
                        style: TextStyle(color: Color(0xFF8D99AE)),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: defaultPadding / 4),
                        child: Text(
                          '62.990.000đ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      Text(
                        '64.990.000đ',
                        style: TextStyle(
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
          margin: EdgeInsets.only(top: defaultPadding / 2),
          padding: EdgeInsets.all(defaultPadding / 2),
          color: Colors.white,
          child: Column(
            children: [
              const Text('Chọn thêm 1 trong những khuyến mãi sau',
                  style: TextStyle(fontSize: 18)),
              Container(
                margin: EdgeInsets.all(defaultPadding),
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
