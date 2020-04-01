import 'package:flutter/material.dart';

import '../../extensions/hover_extensions.dart';

class MenuItem extends GestureDetector {
  MenuItem({
    @required String menuItem,
    @required Function onTap,
  }) : super(
            onTap: onTap,
            child: Text(menuItem).showCursorOnHover.moveUpOnHover);
}
