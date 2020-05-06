import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../../extensions/hover_extensions.dart';
import '../../generated/social_icons.dart';
import 'navigation_menu_list.dart';

class SideMenu extends Drawer {
  const SideMenu(this._scrollController, [Key key]) : super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 175.0,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4.0,
            sigmaY: 4.0,
          ),
          child: Drawer(
            child: Container(
              color: Colors.grey[600],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                      child: IconButton(
                        icon: const Icon(SocialIcons.left_big),
                        color: Theme.of(context).accentColor,
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ).showCursorOnHover,
                    ),
                  ),
                  NavigationMenu(_scrollController),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 30.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
