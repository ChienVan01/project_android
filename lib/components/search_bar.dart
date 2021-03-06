import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white38),
        shadowColor: MaterialStateProperty.all(primaryColor),
        padding: MaterialStateProperty.all(
            const EdgeInsets.only(top: 15, bottom: 15)),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(350, 50)),
        alignment: Alignment.centerLeft,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/search');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: defaultPadding / 2),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.search, color: backgroundColor, size: 25),
            Text('Tìm kiếm', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
