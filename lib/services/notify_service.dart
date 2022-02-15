// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:project_android/model/notify.dart';

import '../constants.dart';

Future<List<Notify>> getAllNotify(context, id) async {
  List<Notify> result = [];
  try {
    final response = await http.get(
      Uri.parse(NotifyUrl + '/user/' + id),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = (item as List).map((p) => Notify.fromJson(p)).toList();
      print(">>>" + result.length.toString());
    }
  } catch (e) {
    rethrow;
  }
  return result;
}
