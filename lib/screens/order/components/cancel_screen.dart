import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/order/components/detail_order.dart';
import 'package:project_android/screens/order/components/order_provider.dart';
import 'package:provider/provider.dart';

class CancelledOrderScreen extends StatefulWidget {
  const CancelledOrderScreen({Key? key, required this.userId})
      : super(key: key);
  final String userId;

  @override
  State<CancelledOrderScreen> createState() => _CancelledOrderScreenState();
}

class _CancelledOrderScreenState extends State<CancelledOrderScreen> {
  @override
  void initState() {
    // print('userId ${widget.userId}');
    super.initState();
    final orders = Provider.of<OrderProvider>(context, listen: false);
    orders.getOrderByStatusProvider(context, widget.userId.toString(), '4');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backgroundColor,
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        child: Consumer<OrderProvider>(builder: (context, state, child) {
          if (state.loading == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (state.orders.isEmpty) {
              return const Center(
                  child: Text(
                'Trống trơn 🌵🌵',
                style: TextStyle(fontSize: 23),
              ));
            } else {
              return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, i) {
                  return detailOrderWidget(
                      id: state.orders[i].orderId,
                      img: state.orders[i].avatar,
                      productName: state.orders[i].name,
                      qty: 1,
                      unitPrice: state.orders[i].totalPrice,
                      status: "Đã hủy bởi bạn",
                      txtButton: "Mua Lại",
                      press: '');
                },
              );
            }
          }
        }));
  }
}
