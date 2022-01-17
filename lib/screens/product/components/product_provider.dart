import 'package:flutter/material.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  Product product = Product(
    id: 0,
    name: '',
    configuration: '',
    info: '',
    origin: '',
    productTypeId: 0,
    price: 0,
    quantity: 0,
    avatar: '',
    status: 0,
    createdAt: '',
    updatedAt: '',
  );
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

  getProductDetailProvider(context, id) async {
    loading = true;
    product = await getProductDetail(context, id);
    loading = false;
    notifyListeners();
  }
}
