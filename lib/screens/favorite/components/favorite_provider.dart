import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/model/cart.dart';

class FavoriteProvider with ChangeNotifier {
  DBConfig db = DBConfig();
  bool isWishlist = false;
  late Future<List<Cart>> wishlist;
  late Future<Cart> wish;

  Future<List<Cart>> getData(int id) async {
    wishlist = db.getCartList(id, 'wishlist');
    return wishlist;
  }

  Future<Cart> getDataProduct(int id, int productId) async {
    wish = db.getProduct(id, 'wishlist', productId);
    return wish;
  }

  void deleteProduct(int id, String table) {
    db.deleteWish(id, 'wishlist');
  }
}
