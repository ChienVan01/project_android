// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:project_android/model/voucher.dart';
import 'package:project_android/services/voucher_service.dart';

class VoucherProvider extends ChangeNotifier {
  List<Voucher> vouchers = [];
  bool loading = false;

  getVoucherByUserID(context, id) async {
    loading = true;
    vouchers = await getAllVoucherByUserID(context, id);
    print("voucher ne: " + vouchers[0].content);
    loading = false;
    notifyListeners();
  }
}
