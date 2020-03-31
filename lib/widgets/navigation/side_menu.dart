import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'navigation_menu_list.dart';
import '../../extensions/hover_extensions.dart';

class SideMenu extends Drawer {
  SideMenu(this.scaffoldKey);
  final GlobalKey<ScaffoldState> scaffoldKey;
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
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.center,
              // padding: EdgeInsets.zero,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          // (scaffoldKey.currentState.isEndDrawerOpen)
                          // ?
                          // print('no'): print('yes');
                          scaffoldKey.currentState.openDrawer();
                          // :
                          // scaffoldKey.currentState.openEndDrawer();
                        },
                      ).showCursorOnHover,
                    ),
                  ],
                ),
                Spacer(),
                ...navigationMenuList(context),
                Spacer(),
                SizedBox(height: 30.0)
              ],
            ),
          ),
        ),
      );
}
