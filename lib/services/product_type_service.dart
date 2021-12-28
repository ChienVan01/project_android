import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:project_android/constants.dart';
import 'package:project_android/model/product_type.dart';

Future<List<ProductType>> getAllProductType(context) async {
  List<ProductType> result = [];
  try {
    final response = await http.get(
      Uri.parse(ProductTypeUrl),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = (item as List).map((p) => ProductType.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return result;
}
