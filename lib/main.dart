import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/detailProduct/detail_product.dart';
import 'package:project_android/screens/favorite/favorite_screen.dart';
import 'package:project_android/screens/order/order_screen.dart';
import 'package:project_android/screens/product/product_screen.dart';
import 'screens/main/main_screen.dart';

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
      initialRoute: '/productdetail',
      routes: {
        '/': (context) => const MainScreen(),
        '/product': (context) => const Product(),
        '/productdetail': (context) => const ProductDetail(),
        '/order': (context) => const OrderScreen(),
        '/favorite': (context) => const FavoriteScreen(),
      },
      // home: const MainScreen(),
    );
  }
}
