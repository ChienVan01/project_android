import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

String txt = '';
Widget detailRatingWidget(context, String img, int rating) {
  return Container(
    padding: const EdgeInsets.fromLTRB(
        defaultPadding, defaultPadding / 2, defaultPadding, defaultPadding / 2),
    margin: const EdgeInsets.only(bottom: defaultPadding / 2),
    color: Colors.white,
    child: Column(
      children: [
        Row(
          children: [
            Row(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Image.asset(
                  'assets/images/product/$img',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                width: 190,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Legion 5",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        for (var i = 1; i <= rating; i++)
                          const Text(
                            '☆',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              // ElevatedButton(
              //     onPressed: () => showRatingDialog(context, img),
              //     child: const Text("Phản Hồi")),
            ]),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 350,
                    child: Column(
                      children: const [
                        Text(
                            "Bạn đã sử dụng sản phẩm của Shop chưa ạ? Nếu rồi hãy đánh giá cho sản phẩm nhé. Cảm ơn bạn rất nhiều !",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ],
                    )),
              ],
            )
          ],
        )
      ],
    ),
  );
}
