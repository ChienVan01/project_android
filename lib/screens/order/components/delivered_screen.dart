import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/order/components/order_provider.dart';
import 'package:provider/provider.dart';

import 'detail_order.dart';

class DeliveredOrderScreen extends StatefulWidget {
  const DeliveredOrderScreen({Key? key, required this.userId})
      : super(key: key);
  final String userId;

  @override
  State<DeliveredOrderScreen> createState() => _DeliveredOrderScreenState();
}

class _DeliveredOrderScreenState extends State<DeliveredOrderScreen> {
  @override
  void initState() {
    // print('userId ${widget.userId}');
    super.initState();
    final orders = Provider.of<OrderProvider>(context, listen: false);
    orders.getOrderByStatusProvider(context, widget.userId.toString(), '3');
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
                      status: "Giao hàng thành công",
                      txtButton: "Đánh Giá",
                      press: '');
                },
              );
            }
          }
        }));
  }
}
