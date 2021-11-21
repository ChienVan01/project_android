import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class Category {
  String name;
  Icon icon;
  Category({required this.name, required this.icon});
}

List<Category> _listCategory = [
  Category(name: 'Laptop', icon: const Icon(Icons.laptop)),
  Category(name: 'Màn hình', icon: const Icon(Icons.monitor)),
  Category(name: 'Bàn phím', icon: const Icon(Icons.keyboard)),
  Category(name: 'Tai nghe', icon: const Icon(Icons.headphones)),
  Category(name: 'Chuột', icon: const Icon(Icons.mouse)),
  Category(name: 'Bàn phím', icon: const Icon(Icons.keyboard)),
  Category(name: 'Màn hình', icon: const Icon(Icons.monitor)),
  Category(name: 'PC', icon: const Icon(Icons.phonelink)),
];

List<Widget> categoryItems(context) => _listCategory
    .map(
      (item) => Container(
        child: Padding(
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
                          Navigator.pushNamed(context, '/product');
                        },
                        icon: item.icon),
                  ),
                ),
                Text(item.name)
              ],
            ),
          ),
        ),
      ),
    )
    .toList();

class ListCategory extends StatelessWidget {
  const ListCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(defaultPadding),
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
            Wrap(
              spacing: 15,
              children: categoryItems(context),
            ),
          ],
        ));
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
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
                        Navigator.pushNamed(context, '/product');
                      },
                      icon: icon),
                ),
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
