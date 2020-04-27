import 'package:flutter/material.dart';

import '../../extensions/hover_extensions.dart';

class MenuItem extends GestureDetector {
  MenuItem({
    Key key,
    @required String menuItem,
    @required Function onTap,
  }) : super(
            key: key,
            onTap: () => onTap,
            child: Text(menuItem).showCursorOnHover.moveUpOnHover);
}
