import 'package:flutter/material.dart';
import 'package:project_android/model/notify.dart';
import 'package:project_android/services/notify_service.dart';

class NotifyProvider extends ChangeNotifier {
  List<Notify> notifies = [];
  bool loading = false;

  getNotifyByUserID(context, id) async {
    loading = true;
    notifies = await getAllNotify(context, id);
    loading = false;
    notifyListeners();
  }
}