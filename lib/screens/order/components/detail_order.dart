import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/rating/components/rating_popup.dart';

class detailOrderWidget extends StatelessWidget {
  detailOrderWidget({
    Key? key,
    required this.img,
    required this.productName,
    required this.unitPrice,
    required this.qty,
    required this.status,
    required this.txtButton,
    this.press,
  }) : super(key: key);
  final String img, productName, status, txtButton;
  String? press;
  final int qty, unitPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding / 2,
          defaultPadding, defaultPadding / 2),
      margin: const EdgeInsets.only(bottom: defaultPadding / 2),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Column(children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                  ),
                  child: Image.asset(
                    'assets/images/product/$img',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ]),
              Column(
                children: [
                  SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(productName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          const SizedBox(height: 10),
                          const Text(
                            "Số lượng : Chưa làm",
                          ),
                          const SizedBox(height: 20),
                          Text(
                              NumberFormat.decimalPattern()
                                      .format(unitPrice)
                                      .toString() +
                                  'đ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontSize: 20,
                              ))
                        ],
                      )),
                ],
              )
            ],
          ),
          const Divider(
            height: 30,
            color: Colors.black,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: const [Text("1 sản phẩm")],
            ),
            Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        const Text(
                          "Thành Tiền:  ",
                        ),
                        Text(
                            NumberFormat.decimalPattern()
                                    .format(unitPrice)
                                    .toString() +
                                'đ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 20,
                            ))
                      ],
                    )),
              ],
            )
          ]),
          const Divider(
            height: 20,
            color: Colors.black,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              const Padding(
                padding: EdgeInsets.only(right: defaultPadding / 2),
                child: Icon(
                  Icons.local_shipping_outlined,
                ),
              ),
              Text(status),
            ]),
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.navigate_next_outlined,
              ),
            ),
          ]),
          const Divider(
            height: 20,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (txtButton != "Đánh Giá") {
                      press == '' ? '' : Navigator.pushNamed(context, press!);
                    } else {
                      showRatingDialog(context, img);
                    }
                  },
                  child: Text(txtButton),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// Widget detailOrderWidget(String img, String productName, int qty,
//     String unitPrice, String status, String txtButton, String press) {
//   return 
// }
