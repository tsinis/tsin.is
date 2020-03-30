import 'package:flutter/material.dart';
import 'navigation_menu_list.dart';

class SideMenu extends Drawer {
  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // padding: EdgeInsets.zero,
          children: navigationMenuList(context),
        ),
      );
}
