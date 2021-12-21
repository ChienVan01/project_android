import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';
import 'package:project_android/model/cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBConfig {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    // await deleteDatabase(path);

    return db;
  }

  _onCreate(Database db, int version) async {
    // await db.execute("DROP TABLE IF EXISTS cart");

    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY , productId INTEGER , name TEXT , origin TEXT , productTypeId INTERGER ,initialPrice INTEGER, price INTEGER , quantity INTEGER, avatar TEXT , status BOOL )');
  }

  Future<Cart> insert(Cart cart) async {
    print(cart.toJson());
    var dbClient = await db;
    await dbClient!.insert('cart', cart.toJson());
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('cart');
    return queryResult.map((e) => Cart.fromJson(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await db;
    return await dbClient!
        .update('cart', cart.toJson(), where: 'id = ?', whereArgs: [cart.id]);
  }
}
