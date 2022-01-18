import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/header.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({
    Key? key, required this.id
  }) : super(key: key);
  final int id;
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        initialIndex: 0,
        length: 1,
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size(double.maxFinite, 50), child: Header()),
          body: BodyRating(id: widget.id),
        ));
  }
}
