import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> firstAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    firstAnimation = Tween<double>(begin: -pi, end: pi).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_chu_s.png',
              width: 150,
            ),
            const SizedBox(height: defaultPadding),
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
