import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/product.dart';

class BodyRecently extends StatelessWidget {
  const BodyRecently({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StaggeredGridView.countBuilder(
            // physics: const BouncingScrollPhysics(),
            crossAxisCount: 4,
            itemCount: product.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/productdetail');
                },
                child: _productItem(
                  title: product[index].name,
                  image: product[index].image,
                  price: product[index].price,
                ),
              );
            },
            staggeredTileBuilder: (int index) =>
                const StaggeredTile.count(2, 2.8),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
        )
      ],
    );
    ;
  }
}

Widget _productItem({required String title, image, price}) {
  return Container(
    padding: const EdgeInsets.all(defaultPadding / 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/product/$image',
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          NumberFormat.decimalPattern().format(price),
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        ),
        Text(
          NumberFormat.decimalPattern().format(price * 1.2),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 13,
              decoration: TextDecoration.lineThrough),
        ),
      ],
    ),
  );
}
