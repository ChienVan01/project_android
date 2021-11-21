import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

final TextEditingController _controller = TextEditingController();

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.navigate_before_outlined, size: 30)),
        // primary: false,
        elevation: 0,
        title: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 18),
          autofocus: true,
          cursorColor: Colors.white,
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Nhập từ khóa tìm kiếm',
            hintStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
            fillColor: Colors.white24,
            filled: true,
            suffixIcon: IconButton(
              onPressed: _controller.clear,
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
