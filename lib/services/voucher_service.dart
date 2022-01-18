import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:project_android/model/voucher.dart';

import '../constants.dart';

Future<List<Voucher>> getAllVoucherByUserID(context, id) async {
  List<Voucher> result = [];
  try {
    final response = await http.get(
      Uri.parse(VoucherUrl + '/user/' + id),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = (item as List).map((p) => Voucher.fromJson(p)).toList();
      print("eqwewqeq" + result[0].name);
    }
  } catch (e) {
    rethrow;
  }
  return result;
}
