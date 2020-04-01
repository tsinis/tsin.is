import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import 'navigation_menu_list.dart';
import '../../extensions/hover_extensions.dart';

class SideMenu extends Drawer {
  SideMenu(this.scrollController);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 175.0,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4.0,
            sigmaY: 4.0,
          ),
          child: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      color: Theme.of(context).accentColor,
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ).showCursorOnHover,
                  ),
                ),
                NavigationMenu(scrollController),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 30.0),
                ),
              ],
            ),
          ),
        ),
      );
}
