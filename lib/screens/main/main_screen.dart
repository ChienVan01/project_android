import 'package:flutter/material.dart';
import 'package:project_android/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 2;
  List<Widget> pageList = <Widget>[
    const Text('Khuyến mãi',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    const Text('Thông báo',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    const HomeScreen(),
    const Text('Giỏ hàng',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    const Text('Tài khoản',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
              icon: Icon(Icons.person_outline, size: 30), label: 'Khuyến mãi'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: footer(),
    );
  }
}