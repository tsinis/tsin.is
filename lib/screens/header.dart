import 'package:flutter/material.dart';
import '../widgets/navigation/navigation_menu_list.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (MediaQuery.of(context).size.width > 640.0)
          ...navigationMenuList(context)
      ],
    );
  }
}
