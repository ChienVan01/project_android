import 'package:flutter/material.dart';

class ItemModel {
  bool expanded;
  String headerItem;
  String discription;
  Color colorsItem;
  Icon icon;
  // Checkbox checkbox;

  ItemModel({
    this.expanded = false,
    required this.headerItem,
    required this.discription,
    required this.colorsItem,
    required this.icon,
    // required this.checkbox
  });
}
