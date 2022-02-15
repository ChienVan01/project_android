// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_android/model/order.dart';

import '../constants.dart';

Future<void> orderService(int paymentId, int userId, int voucherId,
    int orderStatusId, double totalPrice, List cart, context) async {
  // Profile result = Profile( tokenUser: "",
  // user: User(id: 0, email: "", password: "", name: "", phone: "", address: "", avatar: "", userTypeId: 0, status: 0)) ;

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

// Future<OrderDetail> getOrderDetail(context, id) async {
//   OrderDetail result = OrderDetail(
//     id: 0,
//     orderId: 0,
//     productId: 0,
//     unitPrice: '',
//     quantity: 0,
//     intoMoney: '',
//     status: 0,
//     createdAt: '',
//     updatedAt: '',
//   );
//   try {
//     final response = await http.get(
//       Uri.parse(BaseUrl + '/order/detail/' + id),
//       headers: {
//         HttpHeaders.contentTypeHeader: "application/json",
//       },
//     );
//     if (response.statusCode == 200) {
//       final item = json.decode(response.body);

//       result = OrderDetail.fromJson(item);
//     }
//   } catch (e) {
//     rethrow;
//   }
//   return result;
// }

// Future<OrderDetail> getOrderDetail(context, id) async {
//   OrderDetail result = OrderDetail(
//     id: 0,
//     orderId: 0,
//     productId: 0,
//     unitPrice: '',
//     quantity: 0,
//     intoMoney: '',
//     status: 0,
//     createdAt: '',
//     updatedAt: '',
//   );
//   try {
//     final response = await http.get(
//       Uri.parse(BaseUrl + '/order/detail/' + id),
//       headers: {
//         HttpHeaders.contentTypeHeader: "application/json",
//       },
//     );
//     if (response.statusCode == 200) {
//       final item = json.decode(response.body);

//       result = OrderDetail.fromJson(item);
//     }
//   } catch (e) {
//     rethrow;
//   }
//   return result;
// }
