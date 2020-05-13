import 'package:flutter/material.dart';

class OrientationSwitcher extends StatelessWidget {
  const OrientationSwitcher({Key key, this.children, this.columnNotRow})
      : super(key: key);

  final List<Widget> children;
  final bool columnNotRow;

  @override
  Widget build(BuildContext context) => columnNotRow
      ? Column(
          children: children,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min)
      : Row(
          children: children,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min);
}
