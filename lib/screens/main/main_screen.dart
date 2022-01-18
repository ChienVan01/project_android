import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/components/text_style.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/account/account_screen.dart';
import 'package:project_android/screens/cart/cart_screen.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:project_android/screens/discount/discount_screen.dart';
import 'package:project_android/screens/home/home_screen.dart';
import 'package:project_android/screens/login/login_screen.dart';
import 'package:project_android/screens/notification/notification_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UserProfile user = UserProfile(
      id: 0,
      email: '',
      password: '',
      name: '',
      phone: '',
      address: '',
      avatar: '',
      tokenUser: '',
      status: 0);

  Future refreshNote() async {
    user = await DBConfig.instance.getUser();
  }

  int pageIndex = 2;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
    loading();
  }

  Future loading() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 3), () {});
    setState(() => isLoading = false);
  }

  
  List<Widget> pageList = <Widget>[
    const DiscountScreen(),
    NotificationSrceen(id: 4),
    const HomeScreen(),
    const CartScreen(),
    const AccountsScreen(),
  ];

  Widget footer() {
    final cart = Provider.of<CartProvider>(context);
    final double total = cart.getTotalPrice();
    DBConfig dbConfig = DBConfig.instance;
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 27,
        onTap: (value) {
          setState(() {
            pageIndex = value;

            cart.removeTotalPrice(total);
          });
        },
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sell_outlined, size: 25), label: 'Khuyến mãi'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: 'Thông báo'),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 30,
                child: Icon(
                  Icons.home_outlined,
                  size: 45.0,
                ),
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
              child: pageIndex == 3
                  ? user.name == ''
                      ? const Login()
                      : pageList[pageIndex]
                  : pageList[pageIndex],
            ),
            bottomNavigationBar: footer(),
          );
  }
}
