import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/product/components/product_provider.dart';
import 'package:provider/provider.dart';

class DetailRating extends StatefulWidget {
  const DetailRating(
      {Key? key,
      required this.productid,
      required this.rating,
      required this.evaluate})
      : super(key: key);
  final String productid;
  final int rating;
  final String evaluate;

  @override
  _DetailRatingState createState() => _DetailRatingState();
}

class _DetailRatingState extends State<DetailRating> {
  @override
  void initState() {
    super.initState();
    final product = Provider.of<ProductProvider>(context, listen: false);
    product.getProductbyProductID(context, widget.productid);
  }

  @override
  Widget build(BuildContext context) {
    return detailRatingWidget(
        context, widget.productid, widget.rating, widget.evaluate);
  }
}

Widget detailRatingWidget(
    context, String productid, int rating, String evaluate) {
  return Consumer<ProductProvider>(builder: (context, state, child) {
    return Container(
      padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding / 2,
          defaultPadding, defaultPadding / 2),
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
                    'assets/images/product/' + state.product.avatar, //
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.product.name, //
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          rateStar(MainAxisAlignment.start, rating),
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
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(evaluate,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                )),
                          )
                        ],
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  });
}

Widget rateStar(mainAxisAlignment, int rate) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      RatingBar.builder(
          initialRating: rate.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
          onRatingUpdate: (rating) {
            print(rating);
          }),
    ],
  );
}
