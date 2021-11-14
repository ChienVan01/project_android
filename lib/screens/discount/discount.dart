import 'package:project_android/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: DiscountSrceen(), debugShowCheckedModeBanner: false);
  }
}

void _test() {
  //nothing to do
}

/// This is the stateless widget that the main application instantiates.
class DiscountSrceen extends StatelessWidget {
  const DiscountSrceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            onPressed: _test, 
            icon: Icon(Icons.arrow_back_ios)  //phím quay lại screen trước
            ) ,
          title: const Text(
            'Khuyến Mãi',
            style:
                TextStyle(color: backgroundColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: Column(
          // Column
          children: <Widget>[
            Container(
              color: backgroundColor, // Tab Bar color change
              child: const TabBar(
                unselectedLabelColor: primaryTextColor, //màu tab k đc chọn
                labelColor: primaryColor,               //màu tab được chọn
                indicatorColor: primaryColor,           //màu con trỏ, ở đây là cái gạch chân đỏ
                tabs: <Widget>[
                  Tab(
                    text: "Nổi bật",
                  ),
                  Tab(
                    text: "Số lượng có hạn",
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: TabBarView(children: [
                Center(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GFListTile(
                          avatar: Image.asset('assets/images/logo_chu_s.png',
                              width: 60, height: 60),
                          titleText: 'Khuyến Mãi',
                          subTitleText: 'HSD: 31/12/2021',
                          onTap: _test,
                          padding: const EdgeInsets.all(defaultPadding/2),
                          margin: const EdgeInsets.only(top:7.0, bottom: defaultPadding/4),
                          color: Colors.white
                      );
                    },
                  ),
                ),
                Center(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GFListTile(
                          avatar: Image.asset('assets/images/logo_chu_s.png',
                              width: 60, height: 60),
                          titleText: 'Khuyến Mãi',
                          subTitleText: 'HSD: 21/11/2021',
                          onTap: _test,
                          padding: const EdgeInsets.all(defaultPadding/2),
                          margin: const EdgeInsets.only(top:7.0, bottom: defaultPadding/4),
                          color: Colors.white,    //bg-color của 1 tile                     
                      );
                    },
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
