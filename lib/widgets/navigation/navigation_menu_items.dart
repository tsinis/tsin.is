import 'package:flutter/material.dart';

import '../../extensions/hover_extensions.dart';

class MenuItem extends GestureDetector {
  MenuItem({@required String menuItem, @required void Function() onTap, Key key})
      : super(key: key, onTap: () => onTap(), child: Text(menuItem).showCursorOnHover.moveUpOnHover);
}
