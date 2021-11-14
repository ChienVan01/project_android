import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Color(0xffD90429),
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light().copyWith(primary: primaryColor),

        scaffoldBackgroundColor: backgroundColor,
        textTheme:
            Theme.of(context).textTheme.apply(bodyColor: primaryTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
    );
  }
}
