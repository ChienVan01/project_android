// ignore_for_file: unused_import
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/screens/detailProduct/detail_product_screen.dart';
import 'package:project_android/screens/product/components/navbar.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/screens/product/components/product_provider.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key, this.id, this.nameProduct}) : super(key: key);
  final String? id;
  final String? nameProduct;

  @override
  State<ListProduct> createState() => _Liststate();
}

class _Liststate extends State<ListProduct> {
  @override
  void initState() {
    super.initState();
    if (widget.id == '') {
      final products = Provider.of<ProductProvider>(context, listen: false);
      products.getProduct(context);
    } else {
      final products = Provider.of<ProductProvider>(context, listen: false);
      products.getProductbyProductType(context, widget.id);
    }
    widget.nameProduct;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, state, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Navbar(),
          if (widget.nameProduct != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.nameProduct}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              // physics: const BouncingScrollPhysics(),
              crossAxisCount: 4,
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(product: state.products[index]),
                      ),
                    );
                  },
                  child:
                      // state.loading == true
                      //     ? Center(
                      //         child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: const [
                      //           CircularProgressIndicator(),
                      //           SizedBox(height: defaultPadding),
                      //           Text('??ang t???i...')
                      //         ],
                      //       ))
                      _productItem(
                    title: state.products[index].name,
                    image: state.products[index].avatar,
                    price: state.products[index].price,
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
    });
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
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          NumberFormat.decimalPattern().format(price),
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        ),
        Text(
          NumberFormat.decimalPattern().format(price * 1.3),
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
