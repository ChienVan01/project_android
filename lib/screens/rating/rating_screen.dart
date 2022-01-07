import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/header.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.maxFinite, 50), child: Header()),
          body: BodyRating(),
        ));
  }
}
