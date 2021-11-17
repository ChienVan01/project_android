import 'package:flutter/material.dart';
import 'package:project_android/screens/home/components/body.dart';
import 'package:project_android/screens/home/components/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: appBar(context)),
      body: body(),
    );
  }
}
