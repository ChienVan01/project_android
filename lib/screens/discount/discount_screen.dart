import 'package:flutter/material.dart';
import 'package:project_android/screens/discount/component/body.dart';
import 'package:project_android/screens/discount/component/header.dart';

/// This is the stateless widget that the main application instantiates.
class DiscountScreen extends StatelessWidget {
  const DiscountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 50), child: header(context)),
          body: body(context)),
    );
  }
}
