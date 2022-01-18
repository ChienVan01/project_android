import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_android/model/rating.dart';

import '../constants.dart';

Future<List<Rating>> getAllCommentByUserID(context, id) async {
  List<Rating> result = [];
  try {
    final response = await http.get(
      Uri.parse(RatingUrl + '/user/' + id),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = (item as List).map((p) => Rating.fromJson(p)).toList();
      print("result");
    }
  } catch (e) {
    rethrow;
  }
  return result;
}

Future<List<Rating>> getAllCommentByProductID(context, id) async {
  List<Rating> result = [];
  try {
    final response = await http.get(
      Uri.parse(RatingUrl + '/product/' + id),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = (item as List).map((p) => Rating.fromJson(p)).toList();
      print("result");
    }
  } catch (e) {
    rethrow;
  }
  return result;
}

Future<List<Rating>> getAllUser(context, id) async {
  List<Rating> result = [];
  try {
    final response = await http.get(
      Uri.parse(RatingUrl + '/product/' + id),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = (item as List).map((p) => Rating.fromJson(p)).toList();
      print("result");
    }
  } catch (e) {
    rethrow;
  }
  return result;
}

