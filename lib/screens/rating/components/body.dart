import 'package:flutter/material.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/model/user.dart';
import 'package:project_android/screens/rating/components/detail_rating.dart';
import 'package:project_android/screens/rating/components/rating_provider.dart';

import 'package:project_android/screens/rating/components/rating_tab.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class BodyRating extends StatefulWidget {
  const BodyRating({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<BodyRating> createState() => _BodyRatingState();
}

class _BodyRatingState extends State<BodyRating> {
  // UserProfile user = UserProfile(
  //     id: 0,
  //     email: '',
  //     password: '',
  //     name: '',
  //     phone: '',
  //     address: '',
  //     avatar: '',
  //     tokenUser: '',
  //     status: 0);

  // Future refreshNote() async {
  //   user = await DBConfig.instance.getUser();
  // }

  @override
  void initState() {
    super.initState();
    print(widget.id);
    final ratings = Provider.of<RatingProvider>(context, listen: false);
    ratings.getCommentByUserID(context, widget.id.toString()); //widget.id.toString()
  }

  @override
  Widget build(BuildContext context) {
    //refreshNote();
    return Consumer<RatingProvider>(builder: (context, state, child) {
      return Column(
        children: <Widget>[
          // Expanded(
          //   child: ListView.builder(
          //     // physics: const BouncingScrollPhysics(),
          //     itemCount: state.ratings.length,
          //     itemBuilder: (BuildContext context, index) {
          //       return GestureDetector(
          //           onTap: () {},
          //           child: Text(
          //             state.ratings[index].evaluate!,
          //             style: const TextStyle(color: Colors.red),
          //           ));
          //     },
          //   ),
          // ),
          Container(
            color: Colors.white, // Tab Bar color
            child: const TabBar(
              unselectedLabelColor: primaryTextColor, //màu tab k đc chọn
              labelColor: primaryColor, //màu tab được chọn
              indicatorColor:
                  primaryColor, //màu con trỏ, ở đây là cái gạch chân đỏ
              tabs: <Widget>[
                Tab(text: "All"),
                // Tab(text: "5 ☆"),
                // Tab(text: "4 ☆"),
                // Tab(text: "3 ☆"),
                // Tab(text: "2 ☆"),
                // Tab(text: "1 ☆")
              ],
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              ListView.builder(
                  itemCount: state.ratings.length,
                  itemBuilder: (BuildContext context, index) {
                    return DetailRating(
                        productid: state.ratings[index].productId.toString(),
                        rating: state.ratings[index].rate,
                        evaluate: state.ratings[index].evaluate!);
                  })
              // tabRatingWidget(context),
              // tabRatingWidget(context),
              // tabRatingWidget(context),
              // tabRatingWidget(context),
              // tabRatingWidget(context)
            ]),
          ),
        ],
      );
    });
  }
}
