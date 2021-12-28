 import 'package:flutter/material.dart';
import 'package:project_android/model/user.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_android/model/user.dart';

import '../constants.dart';


Future<Profile> login(String email,String password,context) async {
    Profile result = Profile( tokenUser: "",
    user: User(id: 0, email: "", password: "", name: "", phone: "", address: "", avatar: "", userTypeId: 0, status: 0)) ;
    if (email.isNotEmpty && password.isNotEmpty) {  
      final response = await http.post(Uri.parse(LoginUrl),
          body: ({
            "email": email,
            "password": password,
          }));
      //check api status
      if (response.statusCode == 201) {   
        // print ("response status ${response.statusCode}");
        // print ("response body ${response.body}");

        result = Profile.fromJson(json.decode(response.body));
        // print ("result $result");
        // print(result.user!.name);
         ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Successfully")));
        Navigator.pushNamed(context, "/");
        
      } else {
        //  ScaffoldMessenger.of(context)
        //   .showSnackBar(SnackBar(content: Text("Fail to load Data")));
          showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Đăng nhập thất bại "),
            content: Text("Vui lòng nhập lại tài khoản hoặc mật khẩu"),
            
          ));
      }
      
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Black field not allowed")));
    }
    return result;
    
  }