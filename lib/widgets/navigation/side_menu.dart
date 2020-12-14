import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../../generated/my_icons.dart';
import 'navigation_menu_list.dart';

class SideMenu extends Drawer {
  const SideMenu(this._scrollController);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 175,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Drawer(
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, right: 20),
                      child: IconButton(
                        icon: const Icon(MyIcon.arrow_left),
                        color: Theme.of(context).accentColor,
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                  ),
                  NavigationMenu(_scrollController),
                  ConstrainedBox(constraints: const BoxConstraints(maxHeight: 30)),
                ],
              ),
            ),
          ),
        ),
      );
}
