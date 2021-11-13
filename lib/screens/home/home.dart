import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: primaryColor,
          ),
          Container(),
          Positioned(
            // left: 10,
            top: defaultPadding * 4,
            left: defaultPadding,
            right: defaultPadding,
            child: AppBar(
              primary: false,
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0.25),
              title: const TextField(
                decoration: InputDecoration(
                    hintText: 'Nhập từ khóa tìm kiếm',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search, color: primaryColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100), child: appBar()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: primaryColor.withOpacity(0.7)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
