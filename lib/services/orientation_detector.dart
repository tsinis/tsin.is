import 'package:flutter/material.dart';

class OrientationSwitcher extends StatelessWidget {
  const OrientationSwitcher({Key key, this.children, this.tight})
      : super(key: key);

  final List<Widget> children;
  final bool tight;

  @override
  Widget build(BuildContext context) =>
      tight ? Column(children: children) : Row(children: children);
}
