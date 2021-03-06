import 'package:flutter/material.dart';

import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account_and_security/support/components/rich_text.dart';
import 'package:project_android/screens/account_and_security/support/components/unordered_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: defaultPadding / 2),
          child: SizedBox(
              height: 70,
              child: Container(
                color: colorWhite,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: defaultPadding, right: defaultPadding / 2),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: defaultPadding / 2),
                        child: Icon(
                          Icons.menu_outlined,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(backgroundColor),
                          shadowColor: MaterialStateProperty.all(primaryColor),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(top: 15, bottom: 15)),
                          elevation: MaterialStateProperty.all(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(320, 50)),
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/search');
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: defaultPadding / 2),
                          child: Text('T??m ki???m',
                              style:
                                  TextStyle(fontSize: 18, color: primaryColor)),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: defaultPadding / 2),
          child: Container(
              color: colorWhite,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(children: [
                  Text("L??m Sao ????? Mua H??ng / ?????t H??ng Tr??n ???ng D???ng ShopGear",
                      style: style(20, primaryTextColor, FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: defaultPadding / 2, bottom: defaultPadding),
                    child: Row(children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: defaultPadding / 2),
                        child: Icon(
                          Icons.schedule_outlined,
                        ),
                      ),
                      Text("2021-27-10 "),
                      Text("FAQ")
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: Text(
                        "ShopGear Vi???t Nam ch??? h??? tr??? ?????t h??ng v?? giao h??ng cho nh???ng ng?????i mua c?? ?????a ch??? t???i Vi???t Nam.",
                        style: style(16, primaryColor, FontWeight.bold)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: RichTextWidget(
                          text1:
                              "Tr?????c ti??n, b???n c???n x??c minh s??? ??i??n tho???i cho t??i kho???n c???a m??nh ????? c?? th??? ?????t h??ng th??nh c??ng.Xem h?????ng d???n",
                          textStyle1: DefaultTextStyle.of(context).style,
                          text2: " T???i ????y",
                          textStyle2: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor))),
                  const Padding(
                      padding: EdgeInsets.only(bottom: defaultPadding),
                      child: RichTextWidget(
                          text1: "B?????c 1:",
                          textStyle1: TextStyle(
                              fontWeight: FontWeight.bold, color: primaryColor),
                          text2:
                              " T??m s???n ph???m b???n c???n mua b???ng m???t trong nh???ng c??ch  ",
                          textStyle2: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryTextColor))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: const [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 30.0,
                            child: Icon(
                              Icons.search_outlined,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: defaultPadding / 2),
                            child: Text("G?? t??? kh??a"),
                          )
                        ]),
                        Column(children: const [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 30.0,
                            child: Icon(
                              Icons.format_list_bulleted_outlined,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: defaultPadding / 2),
                            child: SizedBox(
                                width: 120,
                                child: Text(
                                  "C??c m???c hi???n th??? t???i trang ch???",
                                  textAlign: TextAlign.center,
                                )),
                          )
                        ]),
                      ]),
                  Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: Row(children: const [
                        RichTextWidget(
                            text1: "Xem chi ti???t ",
                            textStyle1: TextStyle(color: primaryTextColor),
                            text2: "T???i ????y",
                            textStyle2: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor))
                      ])),
                  Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: Row(children: const [
                        RichTextWidget(
                            text1: "B?????c 2:",
                            textStyle1: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            text2: " Tham kh???o v?? l???a ch???n s???n ph???m ph?? h???p",
                            textStyle2: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryTextColor))
                      ])),
                  Row(
                    children: [
                      Text("M???t s??? th??ng tin c???n bi???t khi l???a ch???n s???n ph???m:",
                          style: style(14, primaryTextColor, FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(children: const [
                    UnorderedList([
                      Text("H??nh ???nh ,t??n s???n ph???m"),
                      Text("Gi?? s???n ph???m ( Gi?? g???c / gi?? ??u ????i"),
                      Text("????nh gi?? s???n ph???m"),
                      Text("S??? s???n ph???m b??n ra"),
                      Text("Gi?? s???n ph???m ( Gi?? g???c / gi?? ??u ????i"),
                      Text(
                          "Th??ng tin k???t c???u chi ti???t s???n ph???m , ch??? ????? b???o h??nh (n???u c??)")
                    ])
                  ]),
                  Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: Row(children: const <Widget>[
                        RichTextWidget(
                            text1: "B?????c 3:",
                            textStyle1: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            text2: " Ch???n s???n ph???m",
                            textStyle2: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryTextColor))
                      ])),
                  Column(children: [
                    UnorderedList([
                      const RichTextWidget(
                          text1:
                              "Ch???n Mua ngay ????? thanh to??n s???n ph???m nhanh ch??ng.Xem chi ti???t",
                          textStyle1: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: primaryTextColor),
                          text2: "T???i ????y",
                          textStyle2: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                      RichText(
                        text: TextSpan(
                          text:
                              'N???u kh??ng nh???n Mua ngay, ch???n bi???u t?????ng               ',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: primaryTextColor),
                          children: [
                            WidgetSpan(
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  color: primaryTextColor,
                                  child: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white)),
                            ),
                            const TextSpan(
                                text: ' ????? v??o  Gi??? h??ng ????? ch???n s???n ph???m',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: primaryTextColor)),
                          ],
                        ),
                      ),
                    ])
                  ]),
                  Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: Row(children: const <Widget>[
                        RichTextWidget(
                            text1: "B?????c 4:",
                            textStyle1: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            text2: " Ki???m tra v?? thanh to??n",
                            textStyle2: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryTextColor))
                      ])),
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: Column(children: const [
                      UnorderedList([
                        RichTextWidget(
                            text1:
                                "Xem l???i ?????a ch??? nh???n h??ng ,????n v??? v???n chuy???n,ph????ng th???c thanh to??n tr?????c khi ???n n??t ",
                            textStyle1: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: primaryTextColor),
                            text2: "?????t H??ng",
                            textStyle2: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor)),
                        Text(
                            "N???u c?? y??u c???u ?????c bi???t g?? cho Ng?????i b??n, b???n c?? th??? nh???n v??o n??t ???Tin nh???n???.")
                      ])
                    ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: defaultPadding * 2),
                    child: Text(
                      "Sau khi ?????c h?????ng d???n , h??y tr??? l???i ???ng d???ng ShopGear ????? b???t ?????u h??nh tr??nh mua s???m b???t t???n b???n nh??!",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: Wrap(children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: defaultPadding * 2),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      35.0)), // set the buttons shape. Make its birders rounded etc
                              side: const BorderSide(
                                  color: colorBorder,
                                  style: BorderStyle
                                      .solid), //set border for the button
                              elevation: 0, //buttons Material shadow
                            ),
                            onPressed: () {},
                            child: const Text("C??u h???i th?????ng g???p",
                                style: TextStyle(color: primaryTextColor))),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: defaultPadding * 2),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      35.0)), // set the buttons shape. Make its birders rounded etc
                              side: const BorderSide(
                                  color: colorBorder,
                                  style: BorderStyle
                                      .solid), //set border for the button
                              elevation: 0, //buttons Material shadow
                            ),
                            onPressed: () {},
                            child: const Text("????n h??ng & thanh to??n",
                                style: TextStyle(color: primaryTextColor))),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: backgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    35.0)), // set the buttons shape. Make its birders rounded etc
                            side: const BorderSide(
                                color: colorBorder,
                                style: BorderStyle
                                    .solid), //set border for the button
                            elevation: 0, //buttons Material shadow
                          ),
                          onPressed: () {},
                          child: const Text("????n h??ng",
                              style: TextStyle(color: primaryTextColor)))
                    ]),
                  ),
                  Row(children: const [
                    Text("B??i vi???t c?? h???u ??ch cho b???n kh??ng ?",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]),
                  Wrap(children: [
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: backgroundColor,

                              side: const BorderSide(
                                  color: colorBorder,
                                  style: BorderStyle
                                      .solid), //set border for the button
                              elevation: 0, //buttons Material shadow
                            ),
                            child: Row(children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(right: defaultPadding / 2),
                                child: Icon(
                                  Icons.thumb_up_outlined,
                                  color: primaryTextColor,
                                ),
                              ),
                              Text("C??",
                                  style: TextStyle(color: primaryTextColor))
                            ])),
                        const SizedBox(width: 20),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: backgroundColor,
                              side: const BorderSide(
                                  color: colorBorder,
                                  style: BorderStyle
                                      .solid), //set border for the button
                              elevation: 0, //buttons Material shadow
                            ),
                            child: Row(children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(right: defaultPadding / 2),
                                child: Icon(
                                  Icons.thumb_down_outlined,
                                  color: primaryTextColor,
                                ),
                              ),
                              Text("Kh??ng",
                                  style: TextStyle(color: primaryTextColor))
                            ])),
                      ],
                    ),
                  ]),
                ]),
              )),
        ),
        Container(
            color: colorWhite,
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(children: [
                Wrap(children: const [
                  Text("XEM TR???NG TH??I Y??U C???U H??? TR??? C???A B???N V???I SHOPGEAR"),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: defaultPadding / 2),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 30.0,
                        child: Icon(
                          Icons.inventory_outlined,
                          color: colorWhite,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text("Y??u c???u h??? tr??? c???a t??i")
                    ],
                  ),
                )
              ]),
            )),
        Padding(
          padding: const EdgeInsets.only(top: defaultPadding / 2),
          child: Container(
              color: colorWhite,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(children: [
                  Wrap(children: const [
                    Text("XEM TR???NG TH??I Y??U C???U H??? TR??? C???A B???N V???I SHOPGEAR"),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: defaultPadding / 2),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 30.0,
                          child: Icon(
                            Icons.headphones_outlined,
                            color: colorWhite,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text("Live Chat")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: defaultPadding / 2),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 30.0,
                          child: Icon(
                            Icons.email_outlined,
                            color: colorWhite,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text("Email")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: defaultPadding / 2),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 30.0,
                          child: Icon(
                            Icons.call_outlined,
                            color: colorWhite,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text("??i???n Tho???i")
                      ],
                    ),
                  )
                ]),
              )),
        ),
        Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Center(
              child: Row(children: const [
                Icon(
                  Icons.copyright_outlined,
                ),
                Text("2021 ShopGear. T???t c??? quuy???n ???????c b???o l??u."),
              ]),
            ))
      ],
    );
  }
}
