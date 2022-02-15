import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:project_android/DB/db_config.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/screens/favorite/components/favorite_provider.dart';
import 'package:project_android/screens/favorite/components/tabbar.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.userId}) : super(key: key);
  final int userId;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool check = false;
  DBConfig dbConfig = DBConfig.instance;
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
  // @override
  // void initState() {
  //   super.initState();
  //   check;
  //   refreshNote();
  // }

  // Future refreshNote() async {
  //   user = await DBConfig.instance.getUser();
  // }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<FavoriteProvider>(context);
    return Container(
      color: backgroundColor,
      child: Column(children: <Widget>[
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  TabWidget(
                      width: 40,
                      height: 50,
                      text: Text('tất cả'),
                      icon: SizedBox()),
                  TabWidget(
                      width: 75,
                      height: 50,
                      text: Flexible(child: Text('Trạng Thái')),
                      icon: Icon(Icons.expand_more_outlined)),
                  TabWidget(
                      width: 40,
                      height: 50,
                      text: Text('tất cả'),
                      icon: SizedBox()),
                  TabWidget(
                      width: 75,
                      height: 50,
                      text: Flexible(child: Text('Nghành Hàng')),
                      icon: Icon(Icons.expand_more_outlined)),
                ]),
          ),
        ),
        FutureBuilder(
            future: cart.getData(widget.userId),
            builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: defaultPadding * 5),
                      child: Text('Danh sách yêu thích trống 🌵',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  );
                } else {
                  return Expanded(
                      child: StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          staggeredTileBuilder: (int index) =>
                              const StaggeredTile.count(2, 2.5),
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => Container(
                                width: 180.0,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: colorWhite,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/product/${snapshot.data![index].avatar}',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: defaultPadding / 2),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(children: <Widget>[
                                          Text(
                                            snapshot.data![index].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(
                                          defaultPadding / 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(children: [
                                            Text(
                                              NumberFormat.decimalPattern()
                                                  .format(snapshot
                                                      .data![index].price),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryColor),
                                            ),
                                            Text(
                                              NumberFormat.decimalPattern()
                                                  .format(snapshot
                                                          .data![index].price *
                                                      1.3.toInt()),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                          ]),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                check = true;
                                                print(check);
                                              });
                                              dbConfig.deleteWish(
                                                  snapshot.data![index]
                                                          .productId
                                                          .toString() +
                                                      widget.userId.toString(),
                                                  'wishlist');
                                            },
                                            child: const Icon(
                                              Icons.favorite_outlined,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          //  ProductItem(
                          //                           id: snapshot.data![index].productId.toString() +
                          //                               user.id.toString(),
                          //                           title: snapshot.data![index].name,
                          //                           image: snapshot.data![index].avatar,
                          //                           price: snapshot.data![index].price,
                          //                         )),
                          ));
                }
              }
              return Center(
                child: Text('Danh sách yêu thích trốngg 🌵',
                    style: Theme.of(context).textTheme.headline5),
              );
            })
      ]),
    );
  }
}
