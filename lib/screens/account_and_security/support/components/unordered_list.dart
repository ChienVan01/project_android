// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.widgets);
  final List<Widget> widgets;
  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var widget in widgets) {
      // Add list item
      widgetList.add(UnorderedListItem(widget));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }
    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.widget);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("• "),
        Expanded(
          child: widget,
        ),
      ],
    );
  }
}
