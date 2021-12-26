import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/screens/payment/components/body.dart';
import 'package:project_android/screens/payment/components/header.dart';
import 'package:project_android/screens/payment/components/bottomnav.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, 50), child: header()),
      body: BodyPayment(),
      bottomNavigationBar: BottomNav(),
    );
  }
}
