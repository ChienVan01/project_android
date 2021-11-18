import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:project_android/screens/account/account_screen.dart';
import 'package:project_android/screens/discount/discount.dart';
import 'package:project_android/screens/home/home_screen.dart';
import 'package:project_android/screens/product/product_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 2;
  List<Widget> pageList = <Widget>[
    const Discount(),
    const Center(
      child: Text('Thông báo',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    ),
    const HomeScreen(),
    const Product(),
    const AccountsScreen(),
  ];

  Widget footer() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 27,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sell_outlined, size: 25), label: 'Khuyến mãi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: 'Thông báo'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 35.0,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Giỏ hàng'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 30), label: 'Tài khoản'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[pageIndex],
      ),
      // body: Center(
      //   child: pageList[pageIndex],
      // ),
      bottomNavigationBar: footer(),
    );
  }
}
