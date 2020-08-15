import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../extensions/hover_extensions.dart';

class MenuItem extends GestureDetector {
  MenuItem({@required String menuItem, @required void Function() onTap, Key key})
      : super(
            key: key,
            onTap: () => onTap(),
            child: MouseRegion(cursor: SystemMouseCursors.click, child: Text(menuItem).moveUpOnHover));
}
