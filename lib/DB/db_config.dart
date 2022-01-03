// ignore_for_file: avoid_print

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
    String path = join(documentDirectory.path, 'shopgear.db');
    print(path);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    // await deleteDatabase(path);
    return db;
  }

  _onCreate(Database db, int version) async {
    // await db.execute("DROP TABLE IF EXISTS cart");

    await db.execute(
        'CREATE TABLE cart (id VARCHAR PRIMARY KEY , productId INTEGER, userId INTEGER , name TEXT , origin TEXT , productTypeId INTERGER ,initialPrice INTEGER, price INTEGER , quantity INTEGER, avatar TEXT , status BOOL )');
    await db.execute(
        'CREATE TABLE wishlist (id VARCHAR PRIMARY KEY , productId INTEGER, userId INTEGER , name TEXT , origin TEXT , productTypeId INTERGER ,initialPrice INTEGER, price INTEGER , quantity INTEGER, avatar TEXT , status BOOL )');
  }

  Future<Cart> insert(Cart cart, String table) async {
    print(cart.toJson());
    var dbClient = await db;
    await dbClient!.insert(table, cart.toJson());
    return cart;
  }

  Future<List<Cart>> getCartList(int id, String table) async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query(table, where: 'userID = ?', whereArgs: [id]);
    return queryResult.map((e) => Cart.fromJson(e)).toList();
  }

  Future<Cart> getProduct(int id, String table, int productId) async {
    var dbClient = await db;
    final Map<String, Object?> queryResult = (await dbClient!.query(table,
        where: 'userID = ?, productId',
        whereArgs: [id, productId])) as Map<String, Object?>;
    return Cart.fromJson(queryResult);
  }

  Future<int> delete(String id, String table) async {
    var dbClient = await db;
    return await dbClient!.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteWish(int id, String table) async {
    var dbClient = await db;
    return await dbClient!.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await db;
    return await dbClient!
        .update('cart', cart.toJson(), where: 'id = ?', whereArgs: [cart.id]);
  }
}
