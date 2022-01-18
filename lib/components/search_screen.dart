import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<String> onChanged;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
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
        onChanged: widget.onChanged,
      ),
    );
  }
}
