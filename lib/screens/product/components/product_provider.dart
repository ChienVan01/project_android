import 'package:flutter/material.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  bool loading = false;

  getProduct(context) async {
    loading = true;
    products = await getAllProduct(context);
    loading = false;
    notifyListeners();
  }

  getProductbyProductType(context, id) async {
    loading = true;
    products = await getAllProductbyProductType(context, id);
    loading = false;
    notifyListeners();
  }
}
