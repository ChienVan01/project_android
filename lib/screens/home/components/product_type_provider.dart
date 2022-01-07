import 'package:flutter/material.dart';
import 'package:project_android/model/product_type.dart';
import 'package:project_android/services/product_type_service.dart';

class ProductTypeProvider extends ChangeNotifier {
  List<ProductType> productTypes = [];
  bool loading = false;

  getProductType(context) async {
    loading = true;
    productTypes = await getAllProductType(context);
    loading = false;
    notifyListeners();
  }
}


//ChangeNotifierProvider
//changenotifier
//notifyListeners