import 'package:flutter/material.dart';

class OrientationSwitcher extends StatelessWidget {
  OrientationSwitcher({this.children, this.columnNotRow});

  final List<Widget> children;
  final bool columnNotRow;

  @override
  Widget build(BuildContext context) =>
      columnNotRow ? Column(children: children) : Row(children: children);
}
