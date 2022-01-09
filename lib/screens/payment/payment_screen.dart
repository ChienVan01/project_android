import 'package:flutter/material.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/screens/payment/components/body.dart';
import 'package:project_android/screens/payment/components/header.dart';
import 'package:project_android/screens/payment/components/bottomnav.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.product}) : super(key: key);
  final List<Cart> product;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 50), child: Header()),
      body: BodyPayment(product: widget.product),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
