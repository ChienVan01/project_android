// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_android/components/search_screen.dart';
import 'package:project_android/model/product.dart';
import 'package:project_android/screens/detailProduct/detail_product_screen.dart';
import 'package:project_android/screens/product/components/product_provider.dart';
import 'package:project_android/services/product_service.dart';
import 'package:provider/provider.dart';

class FilterListProduct extends StatefulWidget {
  const FilterListProduct({Key? key}) : super(key: key);

  @override
  _FilterListProductState createState() => _FilterListProductState();
}

class _FilterListProductState extends State<FilterListProduct> {
  // List<Product> products = [];
  List<Product> products = [];
  List<Product> productStock = [];

  String query = '';
  Timer? debouncer;
  @override
  void initState() {
    super.initState();
    final productP = Provider.of<ProductProvider>(context, listen: false);
    productStock = productP.products;
    // init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  // Future init() async {
  //   final products = await search(query);

  //   setState(() => this.products = products);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchWidget(onChanged: searchProduct),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return buildSearchProduct(product);
                }),
          )
        ],
      ),
    );
  }

  Future searchProduct(String query) async => debounce(() async {
        // final products = Provider.of<ProductProvider>(context);
        products = productStock.where((e) {
          final nameLower = e.name.toLowerCase();
          final originLower = e.origin.toLowerCase();
          final searchLower = query.toLowerCase();

          return nameLower.contains(searchLower) ||
              originLower.contains(searchLower);
        }).toList();

        // if (!mounted) return;

        setState(() {
          this.query = query;
          products = products;
        });
      });
  Widget buildSearchProduct(Product product) => InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(product: product))),
        child: ListTile(
          leading: SizedBox(
            width: 50,
            child: Image.network(
              'http://10.0.2.2/upload/product/${product.avatar}',
              fit: BoxFit.cover,
            ),
          ),
          title: Text(product.name),
        ),
      );
}
