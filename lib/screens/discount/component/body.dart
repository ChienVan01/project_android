import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_android/screens/discount/component/voucher_provider.dart';
import 'package:provider/provider.dart';

class DiscountBody extends StatefulWidget {
  const DiscountBody({Key? key}) : super(key: key);

  @override
  _DiscountBodyState createState() => _DiscountBodyState();
}

class _DiscountBodyState extends State<DiscountBody> {
  @override
  void initState() {
    super.initState();
    final vouchers = Provider.of<VoucherProvider>(context, listen: false);
    vouchers.getVoucherByUserID(context, '2'); //widget.id.toString()
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VoucherProvider>(builder: (context, state, child) {
      return Column(
        children: <Widget>[
          Container(
            color: backgroundColor, // Tab Bar color change
            child: const TabBar(
              unselectedLabelColor: primaryTextColor, //màu tab k đc chọn
              labelColor: primaryColor, //màu tab được chọn
              indicatorColor:
                  primaryColor, //màu con trỏ, ở đây là cái gạch chân đỏ
              tabs: <Widget>[
                Tab(
                  text: "Nổi bật",
                ),
                Tab(
                  text: "Số lượng có hạn",
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: TabBarView(children: [
              ListView.builder(
                  itemCount: state.vouchers.length,
                  itemBuilder: (context, index) {
                    return GFListTile(
                        // avatar: Image.asset(state.vouchers[index].logo,
                        //     width: 60, height: 60),
                        titleText: state.vouchers[index].name,
                        subTitleText: "HSD: " + state.vouchers[index].exd,
                        onTap: () {},
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        margin: const EdgeInsets.only(
                            top: 7.0, bottom: defaultPadding / 4),
                        color: Colors.white);
                  }),
              ListView.builder(
                  itemCount: state.vouchers.length,
                  itemBuilder: (context, index) {
                    return GFListTile(
                        // avatar: Image.asset(state.vouchers[index].logo,
                        //     width: 60, height: 60),
                        titleText: state.vouchers[index].name,
                        subTitleText: "HSD: " + state.vouchers[index].exd,
                        onTap: () {},
                        padding: const EdgeInsets.all(defaultPadding / 2),
                        margin: const EdgeInsets.only(
                            top: 7.0, bottom: defaultPadding / 4),
                        color: Colors.white);
                  })
            ]),
          ),
        ],
      );
    });
  }
}
