import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/model/cart.dart';

class FavoriteProvider with ChangeNotifier {
  DBConfig db = DBConfig.instance;
  bool isWishlistCheck = false;
  late Future<List<Cart>> wishlist;
  late Future<Cart> wish;

  Future<List<Cart>> getData(int id) async {
    wishlist = db.getCartList(id, 'wishlist');
    return wishlist;
  }

  Future<Cart> getDataProduct(String id) async {
    wish = db.getProduct(id, 'wishlist');
    return wish;
  }

  isWishlist(value) {
    isWishlistCheck = value;
    return isWishlistCheck;
  }

  // void deleteProduct(int id, String table) {
  //   db.deleteWish(id, 'wishlist');
  // }
}
