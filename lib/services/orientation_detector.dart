import 'package:flutter/material.dart';

class OrientationSwitcher extends StatelessWidget {
  const OrientationSwitcher({Key key, this.children, this.tight})
      : super(key: key);

  final List<Widget> children;
  final bool tight;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return tight
        ? Column(
            children: children,
            // mainAxisAlignment: MainAxisAlignment.spaceAround)
          )
        : Row(
            children: children,
            // mainAxisAlignment: MainAxisAlignment.spaceAround)
          );
  }
}
