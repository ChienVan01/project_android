import 'package:flutter/material.dart';
import 'package:project_android/model/order.dart';
import 'package:project_android/services/order_service.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> orders = [];
  // OrderDetail order = OrderDetail(
  //   id: 0,
  //   orderId: 0,
  //   productId: 0,
  //   unitPrice: '',
  //   quantity: 0,
  //   intoMoney: '',
  //   status: 0,
  //   createdAt: '',
  //   updatedAt: '',
  // );
  bool loading = false;

  getOrderByStatusProvider(context, userId, id) async {
    loading = true;
    orders = await getOrderByStatus(context, userId, id);
    loading = false;
    notifyListeners();
  }

  // Future<OrderDetail> getOrderDetailProvider(context, id) async {
  //   loading = true;
  //   order = await getOrderDetail(context, id);
  //   loading = false;
  //   notifyListeners();
  //   return order;
  // }
}
