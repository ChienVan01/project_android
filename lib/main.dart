// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project_android/components/filter_list_product.dart';
import 'package:project_android/components/search_screen.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/account/account_screen.dart';
import 'package:project_android/screens/account/components/user_provider.dart';
import 'package:project_android/screens/account_and_security/profile/components/updatePhone/update_phone_screen.dart';
import 'package:project_android/screens/address/address_screen.dart';
import 'package:project_android/screens/cart/cart_screen.dart';
import 'package:project_android/screens/account_and_security/address/address_screen.dart';
import 'package:project_android/screens/account_and_security/profile/components/changePassword/change/change_password_screen.dart';
import 'package:project_android/screens/account_and_security/profile/components/changePassword/confirm/confirm_password_screen.dart';
import 'package:project_android/screens/account_and_security/profile/components/updateName/update_name_screen.dart';
import 'package:project_android/screens/account_and_security/profile/profile_screen.dart';
import 'package:project_android/screens/account_and_security/rules/rules_screen.dart';
import 'package:project_android/screens/account_and_security/security_screen.dart';
import 'package:project_android/screens/account_and_security/support/support_screen.dart';
import 'package:project_android/screens/cart/components/cart_provider.dart';
import 'package:project_android/screens/cart/components/product_cart.dart';
import 'package:project_android/screens/choose_voucher/choose_voucher_screen.dart';
import 'package:project_android/screens/detailProduct/detail_product_screen.dart';
import 'package:project_android/screens/discount/component/voucher_provider.dart';
import 'package:project_android/screens/favorite/components/favorite_provider.dart';
import 'package:project_android/screens/favorite/favorite_screen.dart';
import 'package:project_android/screens/forgot_password/step01/forgot_password.dart';
import 'package:project_android/screens/forgot_password/step02/step02.dart';
import 'package:project_android/screens/forgot_password/step03/step03.dart';
import 'package:project_android/screens/home/components/product_type_provider.dart';
import 'package:project_android/screens/loading/loading_screen.dart';
import 'package:project_android/screens/login/login_screen.dart';
import 'package:project_android/screens/notification/component/notify_provider.dart';
import 'package:project_android/screens/order/components/order_provider.dart';
import 'package:project_android/screens/order/order_screen.dart';
import 'package:project_android/screens/payment/payment_screen.dart';
import 'package:project_android/screens/product/components/product_provider.dart';
import 'package:project_android/screens/product/product_screen.dart';
import 'package:project_android/screens/rating/components/rating_popup.dart';
import 'package:project_android/screens/rating/components/rating_provider.dart';
import 'package:project_android/screens/rating/rating_screen.dart';
import 'package:project_android/screens/recently_viewed/recently_screen.dart';
import 'package:project_android/screens/register/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/main/main_screen.dart';
import 'package:project_android/screens/choose_payment/choose_payment_screen.dart';

void main() async {
  // Bloc.observer = SimpleBlocObserver();
  // final ProductRepository productRepository =
  //     ProductRepository(httpClient: http.Client());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductProvider>(
              create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => ProductTypeProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => OrderProvider()),
          ChangeNotifierProvider(create: (_) => RatingProvider()),
          ChangeNotifierProvider(create: (_) => NotifyProvider()),
          ChangeNotifierProvider(create: (_) => VoucherProvider()),
        ],
        child: MaterialApp(
          title: 'Shop Gear',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // primarySwatch: Color(0xffD90429),
            primaryColor: primaryColor,
            colorScheme:
                const ColorScheme.light().copyWith(primary: primaryColor),

            scaffoldBackgroundColor: backgroundColor,
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: primaryTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const MainScreen(),
            '/loading': (context) => const Loading(),
            // '/product': (context) => const ProductScreen(id: null),
            // '/productdetail': (context) => const ProductDetail(),
            // '/order': (context) => const OrderScreen(),
            '/search': (context) => const FilterListProduct(),
            '/favorite': (context) => const FavoriteScreen(),
            '/recently': (context) => const Recently(),
            '/account': (context) => const AccountsScreen(),
            '/account_and_security': (context) => const AccountAndSecurity(),
            '/account_and_security/profile': (context) => const ProfileScreen(),
            '/account_and_security/address': (context) => const AddressScreen(),
            '/account_and_security/support': (context) => const SupportScreen(),
            '/account_and_security/rules': (context) => const RulesScreen(),
            '/login': (context) => const Login(),
            '/forgotpassword': (context) => const ForgotPassword(),
            '/register': (context) => const Register(),
            '/cart': (context) => const CartScreen(),
            '/forgotpassword/step02': (context) => const ForgotPassStep2(),
            '/forgotpassword/step03': (context) => const ForgotPassStep3(),
            '/account_and_security/profile/components/updateName': (context) => const UpdateNameScreen(),
            '/account_and_security/profile/components/updatePhone':(context) => const UpdatePhoneScreen(),
            '/account_and_security/profile/components/changePassword/comfirm':
                (context) => const ConfirmPasswordScreen(),
            '/account_and_security/profile/components/changePassword/change':
                (context) => const ChangePasswordScreen(),
            '/choosevoucher': (context) => const ChooseVoucherScreen(),
            '/choosepayment': (context) => const ChoosePaymentScreen(),
            '/address': (context) => const ChooseAddressScreen(),
            //'/rating': (context)=> const RatingScreen(),
            // '/payment': (context) => const PaymentScreen(),
          },
        ));
  }
}
