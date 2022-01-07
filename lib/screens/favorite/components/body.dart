import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/cart.dart';
import 'package:project_android/screens/favorite/components/favorite_provider.dart';
import 'package:project_android/screens/favorite/components/product_item.dart';
import 'package:project_android/screens/favorite/components/tabbar.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
            future: cart.getData(2),
            builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Giỏ hàng trống 🌵',
                            style: Theme.of(context).textTheme.headline5),
                        const SizedBox(height: 20),
                      ],
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
                        itemBuilder: (context, index) => ProductItem(
                              id: snapshot.data![index].productId,
                              title: snapshot.data![index].name,
                              image: snapshot.data![index].avatar,
                              price: snapshot.data![index].price,
                            )),
                  );

                  // Column(
                  //   children: <Widget>[
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: defaultPadding / 2),
                  //       child: Wrap(
                  //         spacing: 10,
                  //         runSpacing: 10,
                  //         children: <Widget>[
                  //           productItem(
                  //               title: 'Laptop Dell Alienware 1..',
                  //               image: 'product05.jpg',
                  //               price: 62990000),
                  //           productItem(
                  //               title: 'Laptop Dell Alienware 2..',
                  //               image: 'product03.jpg',
                  //               price: 62990000),
                  //           productItem(
                  //               title: 'Laptop Dell Alienware 3..',
                  //               image: 'product04.jpg',
                  //               price: 62990000),
                  //           productItem(
                  //               title: 'Laptop Dell Alienware 4..',
                  //               image: 'product02.jpg',
                  //               price: 62990000),
                  //           productItem(
                  //               title: 'Laptop Dell Alienware 4..',
                  //               image: 'product02.jpg',
                  //               price: 62990000),
                  //           productItem(
                  //               title: 'Laptop Dell Alienware 4..',
                  //               image: 'product02.jpg',
                  //               price: 62990000),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // );
                }
              }
              return Text('Giỏ hàng trống 🌵',
                  style: Theme.of(context).textTheme.headline5);
            })
      ]),
    );
  }
}
