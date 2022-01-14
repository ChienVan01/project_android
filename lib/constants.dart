// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const primaryColor = Color(0xffD90429);
const backgroundColor = Color(0xffEDF2F4);
const primaryTextColor = Color(0xff2B2D42);
const colorWhite = Color(0xffffffff);
const double defaultPadding = 20.0;
const colorBorder = Color(0xffC4C4C4);

const BaseUrl = 'http://10.0.2.2:8000/api';

const ProductUrl = BaseUrl + '/products';
const LoginUrl = BaseUrl + '/login';
const ProductTypeUrl = BaseUrl + '/product_types';
const RegisterUrl = BaseUrl + '/register';
const LogoutUrl = BaseUrl + '/logout';
const UpdateUserUrl = BaseUrl + '/user/update';
const ForgotUserPassword = BaseUrl + '/user/forgot-password';

final otpInputDecoration = InputDecoration(
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: primaryTextColor),
  );
}
