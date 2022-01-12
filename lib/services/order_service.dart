// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_android/model/cart.dart';

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

      // result = Profile.fromJson(json.decode(response.body));
      // // print(result.user!.name);
      //  ScaffoldMessenger.of(context)
      //   .showSnackBar(const SnackBar(content: Text("Register Successfully")));
      // Navigator.pushNamed(context, "/login");
      // jsonResponse = json.decode(response.body.toString());
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(" ${jsonResponse['Message']}")));

      //Or put here your next screen using Navigator.push() method
      // print('success');

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
