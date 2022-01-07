// ignore_for_file: avoid_print

import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBConfig {
  static final DBConfig instance = DBConfig._init();

  static Database? _db;
  DBConfig._init();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }

    return _db = await initDatabase();
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
    await db.execute(
        'CREATE TABLE user (id INTEGER PRIMARY KEY , email TEXT, password VARCHAR, name NVARCHAR, phone VARCHAR , address TEXT , avatar VARCHAR , tokenUser VARCHAR , status INTEGER )');
  }

  Future<Cart> insertCart(Cart cart, String table) async {
    print(cart.toJson());
    var dbClient = await db;
    await dbClient.insert(table, cart.toJson());
    return cart;
  }

  Future<UserProfile> insertUser(UserProfile user) async {
    print(user.toJson());
    var dbClient = await db;
    await dbClient.insert('user', user.toJson());
    return user;
  }

  Future<List<Cart>> getCartList(int id, String table) async {
    var dbClient = await instance.db;
    final List<Map<String, Object?>> queryResult =
        await dbClient.query(table, where: 'userID = ?', whereArgs: [id]);
    return queryResult.map((e) => Cart.fromJson(e)).toList();
  }

  Future<Cart> getProduct(int id, String table, int productId) async {
    var dbClient = await db;
    final Map<String, Object?> queryResult = (await dbClient.query(table,
        where: 'userID = ?, productId',
        whereArgs: [id, productId])) as Map<String, Object?>;
    return Cart.fromJson(queryResult);
  }

  Future<UserProfile> getUser() async {
    var dbClient = await db;
    final queryResult = await dbClient.query('user');
    return UserProfile.fromJson(queryResult.first);
    // return queryResult!.map((e) => UserProfile.fromJson(e)).toList();
  }

  Future<int> delete(id, String table) async {
    var dbClient = await db;
    print('xoa thanh cong');
    return await dbClient.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteWish(int id, String table) async {
    var dbClient = await db;
    return await dbClient.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await db;
    return await dbClient
        .update('cart', cart.toJson(), where: 'id = ?', whereArgs: [cart.id]);
  }
}
