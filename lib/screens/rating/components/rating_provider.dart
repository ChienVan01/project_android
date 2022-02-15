import 'package:flutter/material.dart';
import 'package:project_android/model/rating.dart';
import 'package:project_android/services/rating_service.dart';

class RatingProvider extends ChangeNotifier {
  List<Rating> ratings = [];
  bool loading = false;

  getCommentByUserID(context, id) async {
    loading = true;
    ratings = await getAllCommentByUserID(context, id);
    loading = false;
    notifyListeners();
  }

  getCommentByProductID(context, id) async {
    loading = true;
    ratings = await getAllCommentByProductID(context, id);
    loading = false;
    notifyListeners();
  }
}
