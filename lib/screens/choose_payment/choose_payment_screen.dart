import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/screens/choose_payment/component/model.dart';

class ChoosePaymentScreen extends StatefulWidget {
  const ChoosePaymentScreen({Key? key}) : super(key: key);
  @override
  _PaymentScreen createState() => _PaymentScreen();
}

class _PaymentScreen extends State<ChoosePaymentScreen> {
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    isChecked;
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
        headerItem: 'Thanh Toán Bằng Thẻ Ngân Hàng',
        discription: "VCB",
        colorsItem: Colors.black,
        icon: const Icon(Icons.credit_card)),
    ItemModel(
        headerItem: 'Thanh Toán Bằng Thẻ Ghi Nợ',
        discription: "BIDV",
        colorsItem: Colors.black,
        icon: const Icon(Icons.credit_card)),
    ItemModel(
      headerItem: 'Thanh Toán Khi Nhận Hàng',
      discription: "",
      colorsItem: Colors.black,
      icon: const Icon(Icons.clean_hands),
      // checkbox: Checkbox(
      //   checkColor: Colors.white,
      //   value: isChecked,
      //   onChanged: (bool? value) {
      //     setState(() {
      //       isChecked = value!;
      //     });
      //   },
      // )
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phương Thức Thanh Toán'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 1,
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: itemData[index].icon,
                                  ),
                                  Text(
                                    itemData[index].discription,
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15,
                                        letterSpacing: 0.3,
                                        height: 1.3),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "+123",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: 0.3,
                                        height: 1.3),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.check_circle)),
                                ],
                              )
                            ]),
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        itemData[index].headerItem,
                        style: TextStyle(
                          color: itemData[index].colorsItem,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  isExpanded: itemData[index].expanded,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  itemData[index].expanded = !itemData[index].expanded;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
