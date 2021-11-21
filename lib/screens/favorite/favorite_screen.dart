import 'package:flutter/material.dart';
import 'package:project_android/screens/favorite/components/body.dart';
import 'package:project_android/screens/favorite/components/header.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: headerFavorite(context)),
      body: const Body(),
    );
  }
}
