import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:getwidget/getwidget.dart';

class ChooseVoucherScreen extends StatelessWidget {
  const ChooseVoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 30.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.navigate_before_outlined, size: 30)),
          title: const Text("Chọn Mã Giảm Giá", textAlign: TextAlign.center),
          backgroundColor: primaryColor,
        ),
        body: const _ChooseVoucher(),
      ),
    );
  }
}

class _ChooseVoucher extends StatefulWidget {
  const _ChooseVoucher({Key? key}) : super(key: key);

  @override
  State<_ChooseVoucher> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_ChooseVoucher> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: _voucher.length,
              itemBuilder: (context, index) {
                return GFListTile(
                  avatar:
                      Image.asset(_voucher[index].logo, width: 60, height: 60),
                  titleText: _voucher[index].title,
                  subTitleText: "HSD: " +
                      _voucher[index].expiredDate.day.toString() +
                      "/" +
                      _voucher[index].expiredDate.month.toString() +
                      "/" +
                      _voucher[index].expiredDate.year.toString(),
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  margin: const EdgeInsets.only(
                      top: 7.0, bottom: defaultPadding / 4),
                  color: Colors.white,
                  selected: index == _selectedIndex,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                );
              }),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              minimumSize: const Size.fromHeight(52),
            ),
            child: const Center(
              child: Text(
                'Đồng Ý',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

class Voucher {
  String title;
  DateTime expiredDate;
  String desc;
  String logo;
  Voucher(
      {required this.title,
      required this.expiredDate,
      required this.desc,
      required this.logo});
}

final List<Voucher> _voucher = [
  Voucher(
      title: "Mã Giảm Giá 10%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/10off.png"),
  Voucher(
      title: "Mã Giảm Giá 20%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/20off.png"),
  Voucher(
      title: "Mã Giảm Giá 25%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/25off.png"),
  Voucher(
      title: "Mã Giảm Giá 50%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/50off.png"),
  Voucher(
      title: "Mã Giảm Giá 50%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/50off.png"),
  Voucher(
      title: "Mã Giảm Giá 50%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/50off.png"),
  Voucher(
      title: "Mã Giảm Giá 50%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/50off.png"),
  Voucher(
      title: "Mã Giảm Giá 50%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/50off.png"),
  Voucher(
      title: "Mã Giảm Giá 50%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/50off.png"),
  Voucher(
      title: "Mã Giảm Giá 50%",
      expiredDate: DateTime.utc(2021, 12, 30),
      desc: "",
      logo: "assets/images/sale/50off.png"),
];
