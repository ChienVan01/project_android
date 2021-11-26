import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';



Widget productItem({required String title, image, price}) {
  return Container(
    width: 180.0,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: colorWhite,
    ),
    child: Column(
      children: <Widget>[
        Image.asset(
          'assets/images/product/$image',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding / 2),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(children: <Widget>[
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding / 2),
          child: Align(
              alignment: Alignment.topLeft,
              child: Column(children: [
                Text(
                  NumberFormat.decimalPattern().format(price),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
                Text(
                  NumberFormat.decimalPattern().format(price * 1.3),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough),
                ),
              ])),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: defaultPadding / 2),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                
                const Icon(
                  Icons.favorite_outlined,
                  color: primaryColor,
                ),
                ElevatedButton(
                 
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    side: const BorderSide(color: primaryColor),
                                    
                                ))),
                                    
                    child: const Text("Tìm sản phảm",
                        style: TextStyle(color: primaryColor)))
              ]),
        )
      ],
    ),
  );
}
