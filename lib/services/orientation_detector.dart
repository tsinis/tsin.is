import 'package:flutter/material.dart';

class OrientationSwitcher extends StatelessWidget {
  const OrientationSwitcher({Key key, this.children, this.rowIfWide})
      : super(key: key);

  final List<Widget> children;
  final bool rowIfWide;

  @override
  Widget build(BuildContext context) => rowIfWide
      ? Row(
          children: children,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min)
      : Column(
          children: children,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min);
}
