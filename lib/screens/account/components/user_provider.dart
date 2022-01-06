// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/model/user.dart';

class UserProvider with ChangeNotifier {
  late Future<UserProfile> user;

  // DBConfig db = DBConfig();

  Future<UserProfile> getData() async {
    user = DBConfig.instance.getUser();
    print(user);
    return user;
  }
}
