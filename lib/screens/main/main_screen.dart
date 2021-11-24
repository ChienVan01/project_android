import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account/account_screen.dart';
import 'package:project_android/screens/cart/cart_screen.dart';
import 'package:project_android/screens/discount/discount_screen.dart';
import 'package:project_android/screens/home/home_screen.dart';
import 'package:project_android/screens/product/product_screen.dart';
import 'package:project_android/screens/notification/notification_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 2;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loading();
  }

  Future loading() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 3), () {});
    setState(() => isLoading = false);
  }

  List<Widget> pageList = <Widget>[
    const Discount(),
    const NotificationSrceen(),
    const HomeScreen(),
    const Cart(),
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
    return isLoading
        ? Scaffold(
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
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      strokeWidth: 6,
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text('Đang tải...',
                      style: style(23, primaryTextColor, FontWeight.bold))
                ],
              ),
            ),
          )
        : Scaffold(
            body: PageTransitionSwitcher(
              transitionBuilder:
                  (child, primaryAnimation, secondaryAnimation) =>
                      FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
              child: pageList[pageIndex],
            ),
            bottomNavigationBar: footer(),
          );
  }
}
