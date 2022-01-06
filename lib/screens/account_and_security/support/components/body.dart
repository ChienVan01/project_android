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
                          child: Text('Tìm kiếm',
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
                  Text("Làm Sao Để Mua Hàng / Đặt Hàng Trên Ứng Dụng ShopGear",
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
                        "ShopGear Việt Nam chỉ hỗ trợ đặt hàng và giao hàng cho những người mua có địa chỉ tại Việt Nam.",
                        style: style(16, primaryColor, FontWeight.bold)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: RichTextWidget(
                          text1:
                              "Trước tiên, bạn cần xác minh số điên thoại cho tài khoản của mình để có thể đặt hàng thành công.Xem hướng dẫn",
                          textStyle1: DefaultTextStyle.of(context).style,
                          text2: " Tại Đây",
                          textStyle2: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor))),
                  const Padding(
                      padding: EdgeInsets.only(bottom: defaultPadding),
                      child: RichTextWidget(
                          text1: "Bước 1:",
                          textStyle1: TextStyle(
                              fontWeight: FontWeight.bold, color: primaryColor),
                          text2:
                              " Tìm sản phẩm bạn cần mua bằng một trong những cách  ",
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
                            child: Text("Gõ từ khóa"),
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
                                  "Các mục hiển thị tại trang chủ",
                                  textAlign: TextAlign.center,
                                )),
                          )
                        ]),
                      ]),
                  Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: Row(children: const [
                        RichTextWidget(
                            text1: "Xem chi tiết ",
                            textStyle1: TextStyle(color: primaryTextColor),
                            text2: "Tại đây",
                            textStyle2: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor))
                      ])),
                  Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: Row(children: const [
                        RichTextWidget(
                            text1: "Bước 2:",
                            textStyle1: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            text2: " Tham khảo và lựa chọn sản phẩm phù hợp",
                            textStyle2: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryTextColor))
                      ])),
                  Row(
                    children: [
                      Text("Một số thông tin cần biết khi lựa chọn sản phẩm:",
                          style: style(14, primaryTextColor, FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(children: const [
                    UnorderedList([
                      Text("Hình ảnh ,tên sản phẩm"),
                      Text("Giá sản phẩm ( Giá gốc / giá ưu đãi"),
                      Text("Đánh giá sản phẩm"),
                      Text("Số sản phẩm bán ra"),
                      Text("Giá sản phẩm ( Giá gốc / giá ưu đãi"),
                      Text(
                          "Thông tin kết cấu chi tiết sản phẩm , chế độ bảo hành (nếu có)")
                    ])
                  ]),
                  Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: Row(children: const <Widget>[
                        RichTextWidget(
                            text1: "Bước 3:",
                            textStyle1: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            text2: " Chọn sản phẩm",
                            textStyle2: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryTextColor))
                      ])),
                  Column(children: [
                    UnorderedList([
                      const RichTextWidget(
                          text1:
                              "Chọn Mua ngay để thanh toán sản phẩm nhanh chóng.Xem chi tiết",
                          textStyle1: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: primaryTextColor),
                          text2: "Tại Đây",
                          textStyle2: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                      RichText(
                        text: TextSpan(
                          text:
                              'Nếu không nhấn Mua ngay, chọn biểu tượng               ',
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
                                text: ' để vào  Giỏ hàng để chọn sản phẩm',
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
                            text1: "Bước 4:",
                            textStyle1: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            text2: " Kiểm tra và thanh toán",
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
                                "Xem lại địa chỉ nhận hàng ,đơn vị vận chuyển,phương thức thanh toán trước khi ấn nút ",
                            textStyle1: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: primaryTextColor),
                            text2: "Đặt Hàng",
                            textStyle2: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor)),
                        Text(
                            "Nếu có yêu cầu đặc biệt gì cho Người bán, bạn có thể nhấn vào nút “Tin nhắn”.")
                      ])
                    ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: defaultPadding * 2),
                    child: Text(
                      "Sau khi đọc hướng dấn , hãy trở lại ứng dụng ShopGear để bắt đầu hành trình mua sắm bất tận bạn nhé!",
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
                            child: const Text("Câu hỏi thường gặp",
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
                            child: const Text("Đơn hàng & thanh toán",
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
                          child: const Text("Đơn hàng",
                              style: TextStyle(color: primaryTextColor)))
                    ]),
                  ),
                  Row(children: const [
                    Text("Bài viết có hữu ích cho bạn không ?",
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
                              Text("Có",
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
                              Text("Không",
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
                  Text("XEM TRẠNG THÁI YÊU CẦU HỖ TRỢ CỦA BẠN VỚI SHOPGEAR"),
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
                      Text("Yêu cầu hỗ trợ của tôi")
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
                    Text("XEM TRẠNG THÁI YÊU CẦU HỖ TRỢ CỦA BẠN VỚI SHOPGEAR"),
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
                        Text("Điện Thoại")
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
                Text("2021 ShopGear. Tất cả quuyền được bảo lưu."),
              ]),
            ))
      ],
    );
  }
}
