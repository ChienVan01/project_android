import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_android/constants.dart';
import 'package:project_android/model/product_type.dart';
import 'package:project_android/screens/home/components/product_type_provider.dart';
import 'package:project_android/screens/product/product_screen.dart';
import 'package:provider/provider.dart';

class Category {
  int id;
  String name;
  Icon icon;
  Category({required this.id, required this.name, required this.icon});
}

List<Category> _listCategory = [
  Category(id: 1, name: 'Laptop', icon: const Icon(Icons.laptop)),
  Category(id: 9, name: 'Màn hình', icon: const Icon(Icons.monitor)),
  Category(id: 17, name: 'Bàn phím', icon: const Icon(Icons.keyboard)),
  Category(id: 16, name: 'Tai nghe', icon: const Icon(Icons.headphones)),
  Category(id: 18, name: 'Chuột', icon: const Icon(Icons.mouse)),
  Category(id: 16, name: 'Bàn phím', icon: const Icon(Icons.keyboard)),
  Category(id: 9, name: 'Màn hình', icon: const Icon(Icons.monitor)),
  Category(id: 4, name: 'PC', icon: const Icon(Icons.phonelink)),
];

List<Widget> categoryItems(context) => _listCategory
    .map(
      (item) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 60,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  height: 45,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 0.5),
                    ],
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                      id: item.id.toString(),
                                    )));
                      },
                      icon: item.icon),
                ),
              ),
              Text(item.name)
            ],
          ),
        ),
      ),
    )
    .toList();

class ListCategory extends StatefulWidget {
  const ListCategory({Key? key}) : super(key: key);

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductTypeProvider>(context, listen: false);
    products.getProductType(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductTypeProvider>(builder: (context, state, child) {
      return Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Danh mục',
                style: TextStyle(
                    fontSize: 22,
                    color: primaryTextColor,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 15,
                        children: state.productTypes
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 60,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return ProductScreen(
                                                      id: item.id.toString(),
                                                      nameProduct: item.name);
                                                },
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            height: 45,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 0.5),
                                              ],
                                            ),
                                            child: SizedBox(
                                              child: SvgPicture.network(
                                                'http://10.0.2.2/upload/category/${item.name}.svg',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        item.name,
                                        style: const TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ));
    });
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.productType}) : super(key: key);

  final ProductType productType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                  height: 45,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 0.5),
                    ],
                  ),
                  child: SvgPicture.network(
                      'http://10.0.2.2/upload/category/Laptop.svg')
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/product');
                  //     },
                  //     icon: icon),
                  ),
            ),
            Text(productType.name)
          ],
        ),
      ),
    );
  }
}
