import 'package:flutter/material.dart';
import 'package:project_android/components/search_screen.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account_and_security/address/address_screen.dart';
import 'package:project_android/screens/account_and_security/profile/components/changePassword/change/change_password_screen.dart';
import 'package:project_android/screens/account_and_security/profile/components/changePassword/confirm/confirm_password_screen.dart';
import 'package:project_android/screens/account_and_security/profile/components/updateName/update_name_screen.dart';
import 'package:project_android/screens/account_and_security/profile/profile_screen.dart';
import 'package:project_android/screens/account_and_security/rules/rules_screen.dart';
import 'package:project_android/screens/account_and_security/security_screen.dart';
import 'package:project_android/screens/account_and_security/support/support_screen.dart';
import 'package:project_android/screens/detailProduct/detail_product.dart';
import 'package:project_android/screens/favorite/favorite_screen.dart';
import 'package:project_android/screens/forget_password/step01/forget_password.dart';
import 'package:project_android/screens/forget_password/step02/step02.dart';
import 'package:project_android/screens/forget_password/step03/step03.dart';
import 'package:project_android/screens/login/login_screen.dart';
import 'package:project_android/screens/order/order_screen.dart';
import 'package:project_android/screens/product/product_screen.dart';
import 'package:project_android/screens/register/register_screen.dart';
import 'screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/product': (context) => const Product(),
        '/productdetail': (context) => const ProductDetail(),
        '/order': (context) => const OrderScreen(),
        '/search': (context) => const Search(),
        '/favorite': (context) => const FavoriteScreen(),
        '/account_and_security': (context) => const AccountAndSecurity(),
        '/account_and_security/profile': (context) => const ProfileScreen(),
        '/account_and_security/address': (context) => const AddressScreen(),
        '/account_and_security/support': (context) => const SupportScreen(),
        '/account_and_security/rules': (context) => const RulesScreen(),
        '/login': (context) => const Login(),
        '/forgotpassword': (context) => const ForgotPassword(),
        '/register': (context) => const Register(),
        '/forgotpassword/step02': (context) => const ForgotPassStep2(),
        '/forgotpassword/step03': (context) => const ForgotPassStep3(),
        '/account_and_security/profile/components/updateName': (context) => const UpdateNameScreen(),
        '/account_and_security/profile/components/changePassword/comfirm': (context) => const ConfirmPasswordScreen(),
        '/account_and_security/profile/components/changePassword/change': (context) => const ChangePasswordScreen(),
        
      },
    );
  }
}
