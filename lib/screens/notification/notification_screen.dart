import 'package:flutter/material.dart';
import 'package:project_android/screens/notification/component/body.dart';
import 'package:project_android/screens/notification/component/header.dart';

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: NotificationSrceen(), debugShowCheckedModeBanner: false);
  }
}

/// This is the stateless widget that the main application instantiates.
class NotificationSrceen extends StatelessWidget {
  const NotificationSrceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 50), child: header()),
        body: body(context),
        floatingActionButton: const FloatingActionButton(
          onPressed: _test,
          child: Icon(Icons.delete_outline_rounded),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}

_test() {}
