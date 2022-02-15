// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/model/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  // DBConfig db = DBConfig();
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  bool check = false;
  // bool get check => _check;

  late Future<List<Cart>> cart;
  late Future<List<Cart>> checkout;
  // Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData(int id, String table) async {
    cart = DBConfig.instance.getCartList(id, table);
    return cart;
  }

  // Future<List<Cart>> getCheckout(int id) async {
  //   checkout = DBConfig.instance.getCartList(id, 'checkout');
  //   return checkout;
  // }

  Future<List<Cart>> deleteP(idProduct, id) async {
    print('checkoutid: $idProduct');
    DBConfig.instance.delete(idProduct.toString(), 'checkout');
    cart = DBConfig.instance.getCartList(id, 'checkout');
    return cart;
  }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removerCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }

  bool checked(value, double productPrice) {
    // _totalPrice = 0;
    // value == true ? false : true;
    check = value;
    if (check == true) {
      addTotalPrice(productPrice);
    } else {
      removeTotalPrice(productPrice);
      // removerCounter();
    }
    print(check);
    notifyListeners();
    return check;
  }

  // bool getChecked() {
  //   return check;
  // }
}


// class CartProvider with ChangeNotifier {
//   int quantity = 1;
//   getTuantity() => quantity;
//   // setQuantity(int quantity) => quantity = quantity;

//   // setIsChecked(int isChecked) => isChecked = isChecked;
//   Up() {
//     quantity++;
//     notifyListeners();
//   }

//   Down() {
//     quantity--;
//     notifyListeners();
//   }
// }

// class Checked with ChangeNotifier {
//   double totalPrice = 0;
//   getTotalPrice() => totalPrice;

//   // bool isChecked = false;
//   // getIsChecked() => isChecked;

//   void checked(value, price, numOfItem) {
//     if (value) {
//       totalPrice += (price * numOfItem);
//     } else {
//       totalPrice -= (price * numOfItem);
//     }
//     notifyListeners();
//   }
// }
