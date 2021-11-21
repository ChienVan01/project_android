import 'package:flutter/material.dart';
import 'package:project_android/screens/discount/component/body.dart';
import 'package:project_android/screens/discount/component/header.dart';

class Discount extends StatelessWidget {
  const Discount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: DiscountSrceen(), debugShowCheckedModeBanner: false);
  }
}

/// This is the stateless widget that the main application instantiates.
class DiscountSrceen extends StatelessWidget {
  const DiscountSrceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 50), child: header()),
          body: body(context)),
    );
  }
}
