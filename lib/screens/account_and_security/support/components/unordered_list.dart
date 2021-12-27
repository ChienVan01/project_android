import 'package:flutter/material.dart';

class UnorderedList extends StatelessWidget {
  UnorderedList(this.widgets);
  final List<Widget> widgets;
  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var widget in widgets) {
      // Add list item
      widgetList.add(UnorderedListItem(widget));
      // Add space between items
      widgetList.add(SizedBox(height: 5.0));
    }
    return Column(children: widgetList);
  }
}
class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.widget);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• "),
        Expanded(
          child: widget,
        ),
      ],
    );
  }
}