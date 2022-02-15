import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_android/model/product.dart';

import '../constants.dart';

Future<List<Product>> getAllProduct(context) async {
  List<Product> result = [];
  try {
    final response = await http.get(
      Uri.parse(BaseUrl + '/products'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);

      result = (item as List).map((p) => Product.fromJson(p)).toList();
      print('result $result');
    }
  } catch (e) {
    rethrow;
  }
  
  return result;
}

Future<List<Product>> search(String query) async {
  List<Product> result = [];
  try {
    final response = await http.get(Uri.parse(BaseUrl + '/products'));
    if (response.statusCode == 200) {
      final item = json.decode(response.body);

      result = (item as List).map((p) => Product.fromJson(p)).where((e) {
        final titleLower = e.name.toLowerCase();
        // final authorLower = book.author.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    }
  } catch (e) {
    rethrow;
  }
  return result;
}

Future<List<Product>> getAllProductbyProductType(context, String id) async {
  List<Product> result = [];
  try {
    final response = await http.get(
//http://10.0.2.2:8000/api/product_type/{id}

      Uri.parse(ProductTypeUrl + '/' + id),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);

      result = (item as List).map((p) => Product.fromJson(p)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return result;
}

// import 'dart:convert';

// import 'package:project_android/constants.dart';
// import 'package:project_android/model/product.dart';
// import 'package:http/http.dart' as http;

// abstract class ServiceApi {
//   Future<List<Product>> getProduct();
// }

// class ProductRepository extends ServiceApi {
//   @override
//   Future<List<Product>> getProduct() async {
//     try {
//       var uri = Uri.parse(BaseUrl);
//       var response =
//           await http.get(uri, headers: {"ContentType": "application/json"});
//       var Productlist = ProductFromJson(response.body);

//       return Productlist;
//     } catch (e) {
//       return List<Product>.empty();
//     }
//   }
// }
//http://127.0.0.1:8000/api/1
Future<Product> getProductByID(context, id) async {
  Product result = Product(
      id: 0,
      name: "",
      configuration: "",
      info: "",
      origin: "",
      productTypeId: 0,
      price: 0,
      quantity: 0,
      avatar: "",
      status: 0,
      createdAt: "",
      updatedAt: "");
  try {
    final response = await http.get(
      Uri.parse(ProductUrl + '/' + id),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      result = Product.fromJson(json.decode(response.body));
    }
  } catch (e) {
    rethrow;
  }
  return result;
}
