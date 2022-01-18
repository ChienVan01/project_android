import 'package:flutter/material.dart';
import 'package:project_android/screens/notification/component/body.dart';
import 'package:project_android/screens/notification/component/header.dart';

/// This is the stateless widget that the main application instantiates.
class NotificationSrceen extends StatefulWidget {
  const NotificationSrceen({Key? key, required this.id}) : super(key: key);
 final int id;

  @override
  State<NotificationSrceen> createState() => _NotificationSrceenState();
}

class _NotificationSrceenState extends State<NotificationSrceen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: header(context)),
        body: NotifyBody(id: widget.id),
        floatingActionButton: const FloatingActionButton(
          onPressed: (_test),
          child: Icon(Icons.delete_outline_rounded),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}

_test() {}
