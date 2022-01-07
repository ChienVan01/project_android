// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';

class Respect extends StatelessWidget {
  const Respect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: defaultPadding / 2, bottom: defaultPadding / 2),
      padding: const EdgeInsets.all(defaultPadding / 2),
      color: Colors.white,
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text(
              'Đánh giá  & nhận xét Laptop MSI Stealth GS66 10SE - 407VN',
              style: style(18, primaryTextColor, FontWeight.normal),
            ),
          ),
          const SizedBox(height: defaultPadding),
          boxRate(),
          const SizedBox(height: defaultPadding),
          Text(
            'Đánh giá của sản phẩm này ',
            textAlign: TextAlign.left,
            style: style(18, primaryTextColor, FontWeight.normal),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: <Widget>[
              Container(
                width: 27,
                height: 25,
                color: Colors.grey,
                child: Text(
                  'C',
                  textAlign: TextAlign.center,
                  style: style(20, primaryTextColor, FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding / 2),
                child: Text(
                  'Chiến Văn',
                  style: style(20, primaryTextColor, FontWeight.bold),
                ),
              ),
              const SizedBox(width: 50),
              const Icon(Icons.watch_later_outlined),
              const SizedBox(width: 2),
              Text(
                '2021-27-10 20:38:47',
                style: style(
                    18, primaryTextColor.withOpacity(0.5), FontWeight.normal),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: defaultPadding,
                right: defaultPadding,
                left: defaultPadding * 2),
            child: Container(
              height: 95,
              width: 340,
              color: backgroundColor,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    width: defaultPadding / 2,
                    height: defaultPadding / 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: defaultPadding / 2),
                    child: rateStar(MainAxisAlignment.start),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: defaultPadding / 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nhận xét: ',
                          style: style(18, primaryTextColor, FontWeight.bold),
                        ),
                        Flexible(
                            child: Text(
                                'Hàng đẹp lắm shop ơi, shop là nhất, shop số 1',
                                style: style(
                                    18, primaryTextColor, FontWeight.normal)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget boxRate() {
  return Row(
    children: <Widget>[
      Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '5/5',
              style: style(22, primaryTextColor, FontWeight.bold),
            ),
            rateStar(MainAxisAlignment.center),
            Text(
              '1 đánh giá & nhận xét ',
              textAlign: TextAlign.center,
              style: style(16, primaryTextColor, FontWeight.normal),
            )
          ],
        ),
      ),
      Container(
        width: 220,
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            PercenIndicated(number: '5', percen: 0.7),
            PercenIndicated(number: '4', percen: 0.3),
            PercenIndicated(number: '3', percen: 0),
            PercenIndicated(number: '2', percen: 0),
            PercenIndicated(number: '1', percen: 0),
          ],
        ),
      )
    ],
  );
}

Widget rateStar(mainAxisAlignment) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      RatingBar.builder(
          initialRating: 5,
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

class PercenIndicated extends StatelessWidget {
  const PercenIndicated({Key? key, required this.number, required this.percen})
      : super(key: key);

  final String number;
  final double percen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: defaultPadding / 2),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(number,
                style: style(16, primaryTextColor, FontWeight.normal)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5, right: defaultPadding),
            child: Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 278,
              animation: true,
              lineHeight: 12.0,
              animationDuration: 5000,
              percent: percen,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
