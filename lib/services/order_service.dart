// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/model/order.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/order/order_screen.dart';

import '../constants.dart';

UserProfile user = UserProfile(
    id: 0,
    email: '',
    password: '',
    name: '',
    phone: '',
    address: '',
    avatar: '',
    tokenUser: '',
    status: 0);

Future refreshNote() async {
  user = await DBConfig.instance.getUser();
}

Future<void> orderService(int paymentId, int userId, int voucherId,
    int orderStatusId, double totalPrice, List cart, context) async {
  // Profile result = Profile( tokenUser: "",
  // user: User(id: 0, email: "", password: "", name: "", phone: "", address: "", avatar: "", userTypeId: 0, status: 0)) ;
  refreshNote();

  if (paymentId != 0 &&
      userId != 0 &&
      voucherId != 0 &&
      orderStatusId != 0 &&
      totalPrice != 0 &&
      cart.isNotEmpty) {
    final response = await http.post(
      Uri.parse(SaveOrdertUrl),
      body: json.encode({
        "Payment_id": paymentId,
        "User_id": userId,
        "Voucher_id": voucherId,
        "OrderStatus_id": orderStatusId,
        "TotalPrice": totalPrice,
        "line_items": cart
      }),
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
      },
    );

    //check api status
    if (response.statusCode == 201) {
      print("response status ${response.statusCode}");
      print("response body ${response.body}");
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("Thanh toán thành công"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/", (route) => false);
                    },
                  ),
                ],
              ));
    } else {
      print("response status ${response.statusCode}");
      print("response body ${response.body}");
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Thanh toán không thành công"),
                content: const Text("Vui lòng Thanh toán lại"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Vui lòng không bỏ trống")));
  }
}

Future<List<Order>> getOrderByStatus(context, userId, id) async {
  List<Order> result = [];
  try {
    final response = await http.get(
      Uri.parse(BaseUrl + '/order/status/' + userId + '/' + id),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);

      result = (item as List).map((p) => Order.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return result;
}

Future<void> cancelOrder(id, context) async {
  final response = await http.post(Uri.parse(BaseUrl + '/order/update'),
      body: ({
        'id': id.toString(),
        'OrderStatus_id': '4',
      }));
  //check api status
  if (response.statusCode == 200) {
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(const SnackBar(content: Text("Hủy đơn hàng thành công")));
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Hủy đơn hàng thành công"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    // Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderScreen(
                          userId: user.id.toString(),
                        ),
                      ),
                    );
                    print('user: ${user.id.toString()}');
                  },
                ),
              ],
            ));
    // Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  } else {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Hủy đơn hàng KHÔNG thành công"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
